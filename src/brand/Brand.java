package brand;

public class Brand {
	public int brand_index;
	public String Brandname;
	public int brand_count;
	public int brand_rank;
	public int brand_follwer;
	public String link;
	public String brand_image;
	public String[] images;
	
	
	
	public String[] getImages() {
		return images;
	}

	public void setImages(String[] images) {
		this.images = images;
	}

	public String getBrand_image() {
		return brand_image;
	}

	public void setBrand_image(String brand_image) {
		this.brand_image = brand_image;
	}

	public int getBrand_index() {
		return brand_index;
	}

	public void setBrand_index(int brand_index) {
		this.brand_index = brand_index;
	}

	public String getBrandname() {
		return Brandname;
	}

	public void setBrandname(String Brandname) {
		this.Brandname = Brandname;
	}

	public int getBrand_count() {
		return brand_count;
	}

	public void setBrand_count(int brand_count) {
		this.brand_count = brand_count;
	}

	public int getBrand_rank() {
		return brand_rank;
	}

	public void setBrand_rank(int brand_rank) {
		this.brand_rank = brand_rank;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public Brand() {
		super();
	}
	
	
}
