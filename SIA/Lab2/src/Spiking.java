public class Spiking {
    public static void main(String[] args) {
        int n=10;
        double x[] = new double[n];
        System.out.println("\nValorile lui x in timp\n");
        for(int i=0;i<n;i++)
        {
            x[i] = (Math.random()%100)/100.0; // [0..1.0];
            System.out.println(x[i]);

        }
        System.out.println("\nLIF feedback:\n");

        double suma = 0;
        double prag = 2.6;


        for( int i = 0;i<n;i++)
        {
            suma+=x[i];
            if(suma > prag)
            {
                System.out.println("Fire at "+Integer.toString(i)+" - "+Double.toString(suma-prag));
                suma = 0.0f;
            }
        }
    }
}
