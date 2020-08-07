package brand;

public class Number {

	public String num_out(int number) {
		
		if(number>=1000000)
			return (number/1000000)+ "M "+ (number%1000000)/1000 + "K";
		else if(number >= 1000)
			return (number/1000)+ "K";
		else
			return number+"";
	}
	
}
