public class Recurent {
    public static void main(String []args){
        int n = 20;
       double input[] = {1,1,0,0,0,1,1,1,1,1,0,0,1,0,1,1,1,0,0,1};
        double x1 , w1 = 0.3 ,w2=0.5, h = 0,y;

        for(int i=0;i<n;i++)
        {
            x1 = input[i];
            h = Math.tanh(h*w2+x1*w1);

            if(h>0.4)
            {
                y = 1;
            } else
            {
                y=0;
            }
            System.out.println("y["+i+"]="+y);

        }
    }
}
