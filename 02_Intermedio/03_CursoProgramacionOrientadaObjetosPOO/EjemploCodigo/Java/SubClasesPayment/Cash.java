package Java.SubClasesPayment;

import Java.Payment;

public class Cash extends Payment {
    Double Cash;
    
    public Cash(Integer id, Double Cash){
        super(id);
        this.Cash = Cash;
    }
}
