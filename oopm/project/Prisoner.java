import java.util.*;
import java.util.Random;
import java.lang.Math;


class Prisoner 
{
    int id;
    String name,gender;
    String dob,admit,release;
    String offence;
    String offence_desc;
    String cell_no;
    String sentence;
    Prisoner()
    {
      Random random = new Random();
      id = Math.abs(random.nextInt(899));
      id+=100;
      name=gender=dob=admit=release=offence=offence_desc=cell_no=sentence="";
    }
}
