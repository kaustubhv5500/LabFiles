import { Component, OnInit } from '@angular/core';
import { ProductService } from '../shared/product.service';

@Component({
  selector: 'app-directives',
  templateUrl: './directives.component.html',
  styleUrls: ['./directives.component.css']
})
export class DirectivesComponent implements OnInit {
  isavailable = true;
  public vehicle = "bike";
  colors = ['Red','Blue','Black','Orange','Yellow']
  months = ['JAN','FEB','MARCH','APRIL','MAY','JUNE','JULY','AUG','SEPT','OCT','NOV','DEC'];

  emp = [
    {id : 1, name : 'ABC',age : 34},
    {id : 2, name : 'XYX',age : 13},
    {id : 3, name : 'DEF',age : 53},
    {id : 4, name : 'PQR',age : 74}
  ]

  constructor(private productservice : ProductService) {
   }

   newProducts;

   getProduct() : void {
     this.newProducts = this.productservice.getProducts();
     console.log("Product Details : ",this.newProducts);
   }

  ngOnInit() {
    this.getProduct();
  }

}
