/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package javaapplication12;

/**
 *
 * @author vinature
 */

public class HocSinh {
    public String ten;
    public int diem;
    public boolean phai;
    public HocSinh(String ten,int diem, boolean phai)
    {
        this.ten=ten;
        this.diem=diem;
        this.phai=phai;
    }
    @Override
    public String toString()
    {
       
        
        if(phai==true)
         return ten+"_"+diem+"_Nam";
        else
            return ten+"_"+diem+"_Nu";
            
    }
    
}
