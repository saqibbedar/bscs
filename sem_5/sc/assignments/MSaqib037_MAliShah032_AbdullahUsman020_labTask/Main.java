class Mobile {
    String model;
    int launchYear;
    double price;
    
    Mobile(final String m, final int ly, final double price) {
        this.model = m;
        this.launchYear = ly;
        this.price = price;
    }
    // default
    Mobile(){
        this("Unknown", 0, 0.0);
    }

    void setModel(final String m) {
        this.model = m;
    }
    void setLaunchYear(final int y) {
        this.launchYear = y;
    }
    void setPrice(final double price) {
        this.price = price;
    }
    void set(final String m, final int ly, final double price) {
        this.model = m;
        this.launchYear = ly;
        this.price = price;
    }
    String getModel(){
        return this.model;
    }
    int getYearOfLaunch(){
        return this.launchYear;
    }
    double getPrice() { return this.price; }

    void display(){
        System.out.println("Model: " + this.model + "\nLaunch Year: " + this.launchYear + "\nPrice: $" + this.price);
    }
}

public class Main{
    public static void main(String[] args) {
        Mobile m = new Mobile("Bedar B21", 2025, 250);
        m.display();
    }
}