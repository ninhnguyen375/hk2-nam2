/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BT_JList;

/**
 *
 * @author ninh
 */
public class HOCSINH {

  public String ten;
  public int diem;
  public boolean phai;

  public HOCSINH(String ten, int diem, boolean phai) {
    this.ten = ten;
    this.diem = diem;
    this.phai = phai;
  }

  @Override
  public String toString() {
    if (phai == true) {
      return ten + "_" + diem + "_Nam";
    } else {
      return ten + "_" + diem + "_Nu";
    }
  }
  
}
