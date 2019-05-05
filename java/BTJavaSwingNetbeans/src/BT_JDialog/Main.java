/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BT_JDialog;

import javax.swing.UIManager;
import javax.swing.UnsupportedLookAndFeelException;
import javax.swing.plaf.nimbus.NimbusLookAndFeel;

/**
 *
 * @author ninh
 */
public class Main {

  /**
   * @param args the command line arguments
   * @throws javax.swing.UnsupportedLookAndFeelException
   */
  public static void main(String[] args) throws UnsupportedLookAndFeelException {
    UIManager.setLookAndFeel(new NimbusLookAndFeel());
    
    MyJFrame f = new MyJFrame();
    f.setVisible(true);
  }
  
}
