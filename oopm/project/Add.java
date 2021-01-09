import javax.swing.*;
import java.util.*;
import java.awt.*;
import java.awt.event.*;
import java.util.Random;
import java.lang.Math.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.text.ParseException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.io.FileWriter;
import java.sql.*;

public class Add extends Prisoner implements Serializable
{
  Prisoner z = new Prisoner();
    Add()
    {
      JFrame f = new JFrame("New Prisoner Details");
      f.setLayout(new FlowLayout(FlowLayout.CENTER));
      JPanel p = new JPanel();
      BoxLayout box = new BoxLayout(p,BoxLayout.Y_AXIS);
      p.setLayout(box);
      f.add(p);
      f.setSize(400,475);
      f.setDefaultCloseOperation(JFrame.HIDE_ON_CLOSE);
      f.setVisible(true);


      JLabel l1 = new JLabel("Enter Name : ",SwingConstants.CENTER);
      p.add(l1);
      p.add(Box.createRigidArea(new Dimension(0, 10)));
      JTextField t1 = new JTextField("Name",20);
      p.add(t1);
      p.add(Box.createRigidArea(new Dimension(0, 10)));
      //name = t1.getText();


      JLabel l2 = new JLabel("Enter Date of Birth : ");
      JTextField cal1 = new JTextField("YYYY-MM-DD");
      p.add(l2);
      p.add(Box.createRigidArea(new Dimension(0,10)));
      p.add(cal1);
      p.add(Box.createRigidArea(new Dimension(0,10)));

      JLabel l3 = new JLabel("Enter Gender: ",SwingConstants.CENTER);
      p.add(l3);
      p.add(Box.createRigidArea(new Dimension(0, 10)));
      String[] genders = {"M","F","O"};
      JComboBox cb = new JComboBox(genders);
      p.add(cb);
      p.add(Box.createRigidArea(new Dimension(0, 10)));

      JLabel l4 = new JLabel("Enter Date of Admission : ");
      JTextField cal2 = new JTextField("YYYY-MM-DD");
      p.add(l4);
      p.add(Box.createRigidArea(new Dimension(0,10)));
      p.add(cal2);
      p.add(Box.createRigidArea(new Dimension(0,10)));


      JLabel l5 = new JLabel("Enter Felony: ",SwingConstants.CENTER);
      p.add(l5);
      p.add(Box.createRigidArea(new Dimension(0, 10)));
      String[] crimes = {"Murder","Robbery","Sexual Assault","Drug Trafficking","Human Trafficking","Financial Misconduct","Others"};
      JComboBox cb1 = new JComboBox(crimes);
      p.add(cb1);
      JLabel others = new JLabel("If others please specify : ",SwingConstants.CENTER);
      p.add(others);
      JTextField desc = new JTextField("");
      p.add(desc);
      p.add(Box.createRigidArea(new Dimension(0, 10)));


      JLabel l6 = new JLabel("Enter Initial Cell alloted");
      JTextField cell = new JTextField("Cell No.");
      p.add(l6);
      p.add(Box.createRigidArea(new Dimension(0,10)));
      p.add(cell);
      p.add(Box.createRigidArea(new Dimension(0,10)));


      JButton submit = new JButton("Submit");
      p.add(submit);
      submit.setForeground(Color.green);
      submit.setBackground(Color.white);
      
      Prisoner p1 = new Prisoner();
      int pid  = p1.id; 
      Integer inst = new Integer(pid);      
      String numberAsString = inst.toString();
     

        submit.addActionListener(new ActionListener() {
        public void actionPerformed(ActionEvent ae){
        	
        String s1,s2,s3,s4,s5,s6,s7 = new String();
           s1 = t1.getText();
           s2 = (String)cb.getSelectedItem();
           s3 = (String)cb1.getSelectedItem();
           s4 = desc.getText();
           s5 = cell.getText();
           s6 = cal1.getText();
           s7 = cal2.getText();
        
            try
            {
              FileWriter fw =new FileWriter("src//out.csv",true);
              fw.write(numberAsString);
              fw.write(",");
              fw.write(s1);
              fw.write(",");
              fw.write(s6);
              fw.write(",");
              fw.write(s2);
              fw.write(",");
              fw.write(s7);
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
            f.setVisible(false);
            String out = "ID : " + numberAsString;
            JOptionPane.showMessageDialog(null, out);
        }
            });
        
      
        
    }
   

}
