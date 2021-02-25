import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-data-binding',
  templateUrl: './data-binding.component.html',
  styleUrls: ['./data-binding.component.css']
})
export class DataBindingComponent implements OnInit {
  name = "Angular";
  out : string;
  inp : string;


  onButtonClicked()
  {

    this.out = "Hello World!";

  }

eventLogWhichBtn: any;
eventLogCtrlChk: any;
eventLogAltChk: any;
onButtonClicked2(evt: MouseEvent){
this.eventLogWhichBtn = evt.which;
this.eventLogCtrlChk=  evt.ctrlKey;
this.eventLogAltChk= evt.altKey;
}
months = ["Jan","Feb","March","May","June","July","Aug","Sep","Oct","Nov","Dec"];
isavailable = false;   //variable is set to true
  constructor() { 
    this.inp = "Enter Text Here";
  
  }
  variableOne: boolean = true;
  variableTwo: boolean = true;
  myStyles = {
    'background-color': 'lime',
    'font-size': '20px',
    'font-weight': 'bold'
    }
  setMyStyles() {
  let styles = {
  'background-color': this.variableOne ? 'red' : 'transparent',
  'font-weight': this.variableTwo ? 'bold' : 'normal'
  };
  return styles;
  }


  currentNumber = '0';
  firstOperand = null;
  operator = null;
  waitForSecondNumber = false;

  public getNumber(v: string){
    console.log(v);
    if(this.waitForSecondNumber)
    {
      this.currentNumber = v;
      this.waitForSecondNumber = false;
    }else{
      this.currentNumber === '0'? this.currentNumber = v: this.currentNumber += v;
    
    }
  }

  getDecimal(){
    if(!this.currentNumber.includes('.')){
        this.currentNumber += '.'; 
    }
  }

  public getOperator(op: string){
    console.log(op);  

if(this.firstOperand === null){
    this.firstOperand = Number(this.currentNumber);
}else if(this.operator){
    const result = this.doCalculation(this.operator , Number(this.currentNumber))
    this.currentNumber = String(result);
    this.firstOperand = result;
}
this.operator = op;
this.waitForSecondNumber = true;
console.log(this.firstOperand);
}

  private doCalculation(op , secondOp){
    switch (op){
          case '+':
          return this.firstOperand += secondOp; 
          case '-': 
          return this.firstOperand -= secondOp; 
          case '*': 
          return this.firstOperand *= secondOp; 
          case '/': 
          return this.firstOperand /= secondOp; 
          case '=':
          return secondOp;
    }
  }

  

public clear(){
  this.currentNumber = '0';
  this.firstOperand = null;
  this.operator = null;
  this.waitForSecondNumber = false;
}
  ngOnInit() {
    
  }

}

