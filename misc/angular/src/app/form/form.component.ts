import { Component, OnInit } from '@angular/core';
import {FormGroup , FormBuilder, Validators, FormArray} from '@angular/forms';

@Component({
  selector: 'app-form',
  templateUrl: './form.component.html',
  styleUrls: ['./form.component.css']
})
export class FormComponent implements OnInit {
  items : FormArray;
   

  /* createForm(){
     this.angForm = this.fb.group({

       email : [""],
       password : [""]
     });

   }
   */

  orderForm: FormGroup;

   
  createItem(): FormGroup {
    return this.formBuilder.group({
      name: '',
      description: '',
      price: ''
    });
  }

  addItem(): void {
    this.items = this.orderForm.get('items') as FormArray;
    this.items.push(this.createItem());
  }

  constructor(private formBuilder: FormBuilder) {   }
  
  ngOnInit() {
    this.orderForm = this.formBuilder.group({
      customerName: '',
      email: '',
      items: this.formBuilder.array([ this.createItem() ])
    });
  }

}
