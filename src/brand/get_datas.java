package brand;
import java.util.Calendar;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

public class get_datas {
	Calendar cal = Calendar.getInstance();
    public String[] images =new String[12];
    public String[] image_date =new String[12];
    public String[] taggs =new String[12];
    public String[] links = new String[12];
    public int follwer;
    public int exist=0;
    //WebDriver
    private WebDriver driver;
    //private WebElement element;
    //Properties
    public static final String WEB_DRIVER_ID = "webdriver.chrome.driver";
    public static final String WEB_DRIVER_PATH = "C:\\JavaDev\\Workspace\\jsp_project\\chromedriver.exe";
    
    //크롤링 할 URL
    private String base_url;
    public get_datas() {
        //System Property SetUp
        System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);
        driver = new ChromeDriver();
        base_url = "https://www.instagram.com/";
    }
    
   public void update_url(String url)
   {
	   base_url += url;
	   base_url +="/";
   }
    
 
    public void get_data() {
    	
        try {
            //get page (= 브라우저에서 url을 주소창에 넣은 후 request 한 것과 같다)
            driver.get(base_url);
            
            //System.out.println(driver.getPageSource());
            Document doc = Jsoup.parse(driver.getPageSource());
    		Elements linksOnPage = doc.select(".v1Nh3.kIKUG._bz0w"); //클래스..
    		int i=0;
			 for (Element page : linksOnPage) {
				 
				 //이미지 소스파일
				Element img = page.select("img").first();
				String imgtag = img.outerHtml();
				int num = imgtag.indexOf("src=\"");
				String result = imgtag.substring(num,(imgtag.substring(num).indexOf("\" style")+num));
				result = result.replace("amp;", "").substring(5);
				images[i] = result;
				
				// 게시글 날짜
				String result2 =new String();
				int num2= imgtag.indexOf("on ");
				if(num2 !=(-1))
					{
					result2 = imgtag.substring((num2+3),(imgtag.substring(num2).indexOf("2020")+num2+4));
					if(result2.length()>19)
					{
						result2 = result2.substring(result2.indexOf("2020")-4, result2.indexOf("2020")+4);
						result2 = Integer.toString(cal.get(Calendar.MONTH) + 1) +"월 "+ result2;
					}
					}
				
				else
					result2 = "Un identified";
				image_date[i] =result2;
				
				
				//태그들
				String result3 =new String();
				int num3 = imgtag.indexOf("tagging ");
				int num4=-1;
				if(num3 !=(-1))
					num4 = imgtag.substring(num3).indexOf("이미지");
				
				if((num3 !=(-1))&&(num4 !=(-1)))
					result3 = imgtag.substring((num3+7),(num4+num3));
				else
					result3 = "Unidentified";
				taggs[i] =result3;
				
				
				//게시글 링크
				Element link = page.select("a").first();
				String link_Src = link.outerHtml();
				int num5 = link_Src.indexOf("href=\"")+6;
				String result4 = link_Src.substring(num5, (link_Src.substring(num5).indexOf("\" tabindex")+num5));
				links[i] = result4;
				
				
				i++;
			 }
			 	Elements follower = doc.select(".g47SY");
	    		String data = follower.get(1).outerHtml();
	    		int number = data.indexOf("title");
	    		String resultt = data.substring(number,(data.substring(number).indexOf(">")+number));
	    		follwer =Integer.parseInt(resultt.replaceAll("[^0-9]", ""));
	    		
        } catch (Exception e) {
            
            e.printStackTrace();
        
        } finally {
        	driver.close();
	        driver.quit();
        }
    }

    
    //링크가 존재하지 않는 링크인지 확인!
	   public void link_test() {
	        try {
	            //get page (= 브라우저에서 url을 주소창에 넣은 후 request 한 것과 같다)
	            driver.get(base_url);
	            
	            //System.out.println(driver.getPageSource());
	            Document doc = Jsoup.parse(driver.getPageSource());
	    		Elements linksOnPage = doc.select("._07DZ3"); //클래스..
	    		
	    		Element page = linksOnPage.select("h2").first();
	    		String page_str = page.outerHtml();
	    		if(page_str !=null)
	    			this.exist =1;
	        } catch (Exception e) {
	            
	            e.printStackTrace();
	        
	        } finally {
	        	driver.close();
		        driver.quit();
	        }
	    }
}
