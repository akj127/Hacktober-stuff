import java.util.*;
public class Cuboid
{
  int l;
  int b;
  int h;
  public Cuboid(int l, int b, int h)
  {
    this.l = l;
    this.b = b;
    this.h = h;
  }
  public int surfaceArea()
  {
    return 2*(this.l*this.b + this.l*this.h + this.b*this.h);
  }
  public boolean isCuboid()
  {
    if (this.l != this.b != this.h)
    {
      return true
    }
    return false
  }
  public int volume()
  {
    return this.l*this.b*this.h;
  }
  public static void main(Strings[] args)
  {
    Scanner jk = new Scanner(System.in);
    System.out.print("Input Length of Cuboid ");
    int l = jk.nextInt();
    System.out.println();
    System.out.print("Input Breadth of Cuboid ");
    int b = jk.nextInt();
    System.out.println();
    System.out.print("Input Height of Cuboid ");
    int h = jk.nextInt();
    System.out.println();
    // Printing Surface Area and Volume
    Cuboid cuba = new Cuboid(2,3,4);
    System.out.println(cuba.surfaceArea());
    System.out.println(cuba.volume());
  }

}
