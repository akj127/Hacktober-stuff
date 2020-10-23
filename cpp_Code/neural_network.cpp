#include "stdafx.h"
#include "boost\numeric\ublas\matrix.hpp"
#include "boost\numeric\ublas\vector.hpp"
#include "mnist_loader.h"
#include <cmath>
#include <iostream>
#include <random>
#include <vector>

using namespace boost::numeric;
std::random_device rd;
std::mt19937 gen(rd());
void sigmoid(ublas::vector<double> &v) {
	for (auto &iz : v) {
		iz = 1.0 / (1.0 + exp(-iz));
	}
}
void sigmoid_prime(ublas::vector<double> &v) {
	for (auto &iz : v) {
		iz = 1.0 / (1.0 + exp(-iz));
		iz = iz * (1 - iz);
	}
}

class Network {
private:
	std::vector<int> m_sizes;
	using BiasesVector = std::vector<ublas::vector<double>>;
	using WeightsVector = std::vector<ublas::matrix<double>>;
	BiasesVector biases;
	WeightsVector weights;

public:
	void PopulateZeroWeightsAndBiases(BiasesVector &b, WeightsVector &w) const {
		for (size_t i = 1; i < m_sizes.size(); ++i) {
			b.push_back(ublas::zero_vector<double>(m_sizes[i]));
			w.push_back(ublas::zero_matrix<double>(m_sizes[i], m_sizes[i - 1]));
		}
	}
	ublas::vector<double> feedforward(ublas::vector<double> a) const {
		for (auto i = 0; i < biases.size(); ++i) {
			ublas::vector<double> c = prod(weights[i], a) + biases[i];
			sigmoid(c);
			a = c;
		}
		return a;
	}
	using TrainingData = std::pair<ublas::vector<double>, ublas::vector<double>>;
	using TrainingDataIterator = typename std::vector<TrainingData>::iterator;
	void SGD(std::vector<TrainingData> training_data, int epochs, int mini_batch_size, double eta,
		std::vector<TrainingData> test_data) {
		for (auto j = 0; j < epochs; j++) {
			std::shuffle(training_data.begin(), training_data.end(), rd);
			for (auto i = 0; i < training_data.size(); i += mini_batch_size) {
				auto iter = training_data.begin();
				std::advance(iter, i);
				update_mini_batch(iter, mini_batch_size, eta);
			}
			if (test_data.size() != 0)
				std::cout << "Epoch " << j << ": " << evaluate(test_data) << " / " << test_data.size() << std::endl;
			else
				std::cout << "Epoch " << j << " complete" << std::endl;
		}
	}

	void backprop(const ublas::vector<double> &x, const ublas::vector<double> &y, BiasesVector &nabla_b,
		WeightsVector &nabla_w) {
		auto activation = x;
		std::vector<ublas::vector<double>> activations; // Stores the activations of each layer
		activations.push_back(x);
		std::vector<ublas::vector<double>> zs; // The z vectors layer by layer
		for (auto i = 0; i < biases.size(); ++i) {
			ublas::vector<double> z = prod(weights[i], activation) + biases[i];
			zs.push_back(z);
			activation = z;
			sigmoid(activation);
			activations.push_back(activation);
		}
		// backward pass
		auto iActivations = activations.end() - 1;
		auto izs = zs.end() - 1;
		sigmoid_prime(*izs);
		ublas::vector<double> delta = element_prod(cost_derivative(*iActivations, y), *izs);
		auto ib = nabla_b.end() - 1;
		auto iw = nabla_w.end() - 1;
		*ib = delta;
		iActivations--;
		*iw = outer_prod(delta, trans(*iActivations));

		auto iWeights = weights.end();
		while (iActivations != activations.begin()) {
			izs--;
			iWeights--;
			iActivations--;
			ib--;
			iw--;
			sigmoid_prime(*izs);
			delta = element_prod(prod(trans(*iWeights), delta), *izs);
			*ib = delta;
			*iw = outer_prod(delta, trans(*iActivations));
		}
	}
	// Return the number of test inputs for which the neural
	//	network outputs the correct result. Note that the neural
	//	network's output is assumed to be the index of whichever
	//	neuron in the final layer has the highest activation.
	int evaluate(const std::vector<TrainingData> &td) const {
		return count_if(td.begin(), td.end(), [this](const TrainingData &testElement) {
			auto res = feedforward(testElement.first);
			return (std::distance(res.begin(), max_element(res.begin(), res.end())) ==
				std::distance(testElement.second.begin(),
					max_element(testElement.second.begin(), testElement.second.end())));
		});
	}
	ublas::vector<double> cost_derivative(const ublas::vector<double> &output_activations,
		const ublas::vector<double> &y) const {
		return output_activations - y;
	}
};

int main() {
	std::vector<Network::TrainingData> td, testData;
	try {
		mnist_loader<double> loader("..\\Data\\train-images.idx3-ubyte", "..\\Data\\train-labels.idx1-ubyte", td);
		mnist_loader<double> loader2("..\\Data\\t10k-images.idx3-ubyte", "..\\Data\\t10k-labels.idx1-ubyte", testData);
	}
	catch (const char *ex) {
		std::cout << "Error: " << ex << std::endl;
		return 0;
	}
	Network net({ 784, 30, 10 });
	net.SGD(td, 30, 10, 3.0, testData);

	return 0;
}
