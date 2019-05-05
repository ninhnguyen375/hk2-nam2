package BT_Dialog;

import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class MyFrame extends JFrame{
  private JButton openDialogButton;
  private JTextField textField;
  private JPanel myFrameRootPanel;

  private void initComponent() {
    add(myFrameRootPanel);
    setSize(300,300);

    openDialogButton.addActionListener(e -> onClickOpenDialog());
  }
  public MyFrame() {
    initComponent();
  }
  private void onClickOpenDialog() {
    MyDialog dlg = new MyDialog(this, true);
    dlg.setText(this.textField.getText());
    dlg.setVisible(true);

    this.textField.setText(dlg.getText());
  }
}
