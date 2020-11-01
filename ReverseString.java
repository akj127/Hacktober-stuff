/**
 * This program reverses a String.
 *
 * Author: AnxietyMedicine (GitHub)
 */
public class ReverseString {
    public static String reverseString(String s) {
        StringBuilder reverse = new StringBuilder();

        for (int i = s.length() - 1; i >= 0; i--) {
            reverse.append(s.charAt(i));
        }

        return reverse.toString();
    }

    public static void main(String[] args) {
        String s = "The quick brown fox jumps over the lazy dog.";
        System.out.println("Original: " + s);

        String reverse = reverseString(s);
        System.out.println("Reversed: " + reverse);
    }
}
