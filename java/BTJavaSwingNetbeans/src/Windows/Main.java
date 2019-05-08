/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Windows;

import javax.swing.UIManager;
import javax.swing.UnsupportedLookAndFeelException;
import javax.swing.plaf.nimbus.NimbusLookAndFeel;

/**
 *
 * @author ninh
 */
public class Main {
  public static void main(String[] agrs) throws UnsupportedLookAndFeelException {
    UIManager.setLookAndFeel(new NimbusLookAndFeel());
    
    MyFrame f = new  MyFrame();
    f.setVisible(true);
  }
}
