import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import {FormsModule} from '@angular/forms';
import {ReactiveFormsModule} from '@angular/forms';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { DataBindingComponent } from './data-binding/data-binding.component';
import { FormComponent } from './form/form.component';
import { DirectivesComponent } from './directives/directives.component';
import { ProductService } from './shared/product.service';


@NgModule({
  declarations: [
    AppComponent,
    DataBindingComponent,
    FormComponent,
    DirectivesComponent,
  ],
  providers : [
    ProductService
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule,
    ReactiveFormsModule
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
