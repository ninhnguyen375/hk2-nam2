package BT_Dialog;

import javax.swing.*;

public class MyDialog extends JDialog {
  private JPanel myDialogRootPanel;
  private JButton buttonOK;
  private JTextField textField;

  public MyDialog(JFrame parent, boolean modal) {
    super(parent, modal);
    initComponent();
  }

  public String getText() {
    return this.textField.getText();
  }

  public void setText(String text) {
    this.textField.setText(text);
  }
  private void initComponent() {
    add(myDialogRootPanel);
    setSize(300,300);
    buttonOK.addActionListener(e -> onOK());

  }
  private void onOK() {
    dispose();
  }
}
