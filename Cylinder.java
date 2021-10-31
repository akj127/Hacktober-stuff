import java.util.*;

public class Cylinder
{
 
 int r;
 int l;
 public Cylinder(int r, int l)
 {
  this.r = r;
  this.l = l;
 }
 public static int surfaceArea()
 {
  if (r==0)
  {
   System.out.println("Its a stick");
   return 0;
  }
  else if (l==0)
  {
   System.out.println("Its a button");
   return 0;
  }
  else
  {
   return 2*Math.pi*r*l;
  }
 }
 public static int volume()
 {
  return 2*Math.pi*r*l;
 }
 public static int totalSA()
 {
  return 2*Math.pi*r*l + 2 * Math.pi*r*r;
 }
 public staic int flatOrNot()
 {
  if (this.r>this.l)
  {
   System.out.println("Cylinder is lying flat");
  }
  else if (this.r==this.l)
  {
   System.out.println("This ain't a cylinder");
  }
  else
  {
   System.out.print("Cylinder is standing");
  }
 }
 public static void main(Strings[] args)
 {
   Scanner jk = new Scanner(System.in);
   System.out.print("Enter Radius of Cylinder");
   int r = jk.nextInt();
   System.out.print("Enter Length of Cylinder");
   int l = jk.nextInt();
   Cylinder cyc = new Cylinder(r,l);
   System.out.println("Surface Area "+cyc.surfaceArea());
   System.out.println("Total Surface Area "+cyc.totalSA());
   System.out.println("Volume of Cylinder "+cyc.volume());
 }
}
