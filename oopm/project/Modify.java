import java.awt.event.*;
import javax.swing.*;
import java.awt.*;
import java.io.FileWriter;
import java.io.Serializable;

class Modify extends Prisoner implements Serializable
{
Modify()
{
JFrame frame = new JFrame("Modify Prisoner");
frame.setVisible(true);
frame.setLayout(new FlowLayout(FlowLayout.CENTER));
      JPanel p = new JPanel();
      BoxLayout box = new BoxLayout(p,BoxLayout.Y_AXIS);
      p.setLayout(box);
      frame.add(p);
      frame.setSize(400,475);
      frame.setDefaultCloseOperation(JFrame.HIDE_ON_CLOSE);
     
 JLabel lab1 = new JLabel("Enter Prisoner ID:",SwingConstants.CENTER);
      p.add(lab1);
      p.add(Box.createRigidArea(new Dimension(0, 12)));
      JTextField ta1 = new JTextField(" Prisoner ID",20);
      p.add(ta1);
      p.add(Box.createRigidArea(new Dimension(0, 10)));
      
      JLabel lab2 = new JLabel("Add Felony : ",SwingConstants.CENTER);
      p.add(lab2);
      p.add(Box.createRigidArea(new Dimension(0, 10)));
      JTextField ta2 = new JTextField("Crime",20);
      p.add(ta2);
      p.add(Box.createRigidArea(new Dimension(0, 10)));
      
      JLabel lab3 = new JLabel("Punishment Reduction/Extension Reason: ");
      p.add(lab3);
      p.add(Box.createRigidArea(new Dimension(0, 10)));
      String[] exempt = {"Good Behavior","Guilty of Specified Violence","Misconduction with Warden","Extra Working Hours","Social Service Hours"};
      JComboBox cb = new JComboBox(exempt);
      p.add(cb);
      p.add(Box.createRigidArea(new Dimension(0, 10)));
      
      JLabel lab4 = new JLabel("Years Substracted/Added : ",SwingConstants.CENTER);
      p.add(lab4);
      p.add(Box.createRigidArea(new Dimension(0, 10)));
      String[] years = {"1","2","3","4","5","6","7"};
      JComboBox cb2 = new JComboBox(years);
      p.add(cb2);
      p.add(Box.createRigidArea(new Dimension(0, 10)));
      
       JLabel l5 = new JLabel("Enter Date of Release : ");
      JTextField cal3 = new JTextField("YYYY-MM-DD");
      p.add(l5);
      p.add(Box.createRigidArea(new Dimension(0,10)));
      p.add(cal3);
      p.add(Box.createRigidArea(new Dimension(0,10)));
      
       JButton close = new JButton("Submit");
        p.add(Box.createRigidArea(new Dimension(0, 10)));
        close.setBounds(0,0,50,100);
        close.setForeground(Color.red);
       close.setBackground(Color.white);
       p.add(close);
      
       close.addActionListener(new ActionListener() {
           public void actionPerformed(ActionEvent ae){
           	
           String s1,s2,s3,s4,s5,s6,s7 = new String();
           
           s1 = ta1.getText();
           s2 = ta2.getText(); 
           s3 = (String)cb.getSelectedItem();
           s4 = (String)cb2.getSelectedItem();
           s5 =  cal3.getText();
                   	   

               try
               {
                 FileWriter fw =new FileWriter("src//modify.csv",true);
                 fw.write(s1);
                 fw.write(",");
                 fw.write(s2);
                 fw.write(",");
                 fw.write(s3);
                 fw.write(",");
                 fw.write(s4);
                 fw.write(",");
                 fw.write(s5);
                 fw.write("\n");
                 fw.close();
               }
               catch(Exception e)
               {
                 System.out.println(e);
               }
               frame.setVisible(false);
           }
               });
      

//frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);


}


}
