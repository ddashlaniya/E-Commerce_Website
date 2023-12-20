package features;

public class GetWordLimit {

	public String getWordLimit(String desc) {
		
		String[] LimitedWord = desc.split(" ");
		
		if(desc.length()>10) {
			String liWord = "";
			for(int i=0; i<10; i++) {
				liWord = liWord +LimitedWord[i]+" "; 
			}
		}else {
			return desc;
		}
		return (desc+"...");
	}
	
}
