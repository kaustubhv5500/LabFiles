import { Injectable } from '@angular/core';
import { Products } from './Products';

@Injectable({
  providedIn: 'root'
})
export class ProductService {

  getProducts() {
    return Products;
  }
  constructor() { }
}
