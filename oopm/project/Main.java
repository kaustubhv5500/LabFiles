import java.awt.event.*;
import javax.swing.*;
import java.awt.*;


class menu extends JFrame
{
  menu()
  {
      JFrame j = new JFrame("Prison Management System");
      j.setLayout(new FlowLayout(FlowLayout.CENTER));
      j.setSize(400,300);
      j.setLocation(300,20);
      j.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

      JPanel pn = new JPanel();
      pn.setLayout(new BoxLayout(pn,BoxLayout.Y_AXIS));

      JLabel Title = new JLabel("Welcome to Prison Managment!\n");
      pn.add(Title);
      pn.add(Box.createRigidArea(new Dimension(0, 10)));
      JLabel labout = new JLabel();


      JButton[] butts = new JButton[5];

      butts[0] = new JButton("Add Prisoner");
      butts[1] = new JButton("Modify Prisoner");
      butts[2] = new JButton("Analyse Prisoner Data");
      butts[3] = new JButton("Exit");

      int x = 50;
      for (int i = 0 ; i < 4 ; i++)
      {
        pn.add(butts[i]);
        pn.add(Box.createRigidArea(new Dimension(0, 10)));
        butts[i].setBounds(0,0,x,100);
        //butts[i].addActionListener(this);
        butts[i].setBackground(Color.white);
        x = x + 100;
      }



      butts[0].addActionListener((ActionEvent ae) -> {
          labout.setText("Add Prisoner was selected");
          Add a = new Add();
          
      });

      butts[1].addActionListener((ActionEvent ae) -> {
          labout.setText("Modify prisoner was selected");
          Modify md = new Modify();
      });

      butts[2].addActionListener((ActionEvent ae) -> {
          labout.setText("Analyse Prisoner was selected");
          Analyse al = new Analyse();
          al.table();

      });

        butts[3].addActionListener((ActionEvent ae) -> {
            System.exit(0);
      });
          j.add(pn);
          pn.add(labout);
          j.setVisible(true);

          JLabel credits = new JLabel("Created By: Kaustubh | Gokul | Karan | Kshtij");
          pn.add(credits);
}
}

class Main
{
  public static void main(String[] args) {
    SwingUtilities.invokeLater(() -> {
        menu m = new menu();
  
    });
  }
}
