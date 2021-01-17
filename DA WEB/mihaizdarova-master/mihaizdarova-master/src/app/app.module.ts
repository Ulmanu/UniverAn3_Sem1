import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { MDBBootstrapModule } from 'angular-bootstrap-md';
import {APP_BASE_HREF} from '@angular/common';

import { AppComponent } from './app.component';
import { GaleryComponent } from './galery/galery.component';
import { FooterComponent } from './footer/footer.component';
import { MenuComponent } from './menu/menu.component';
import { SubscribeComponent } from './subscribe/subscribe.component';
import { NavbarComponent } from './navbar/navbar.component';
import {AppRoutingModule} from './app-routing.module';
import {RouterModule} from '@angular/router';
import {LoginComponent} from './account/login/login.component';
import {RegisterComponent} from './account/register/register.component';
import {ReactiveFormsModule} from '@angular/forms';
import { ContemporaryComponent } from './contemporary/contemporary.component';
import { HistoryComponent } from './history/history.component';
import { BaroqueComponent } from './baroque/baroque.component';
import { RenaissanceComponent } from './renaissance/renaissance.component';

@NgModule({
  declarations: [
    AppComponent,
    GaleryComponent,
    FooterComponent,
    MenuComponent,
    SubscribeComponent,
    NavbarComponent,
    LoginComponent,
    RegisterComponent,
    ContemporaryComponent,
    HistoryComponent,
    BaroqueComponent,
    RenaissanceComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    RouterModule,
    ReactiveFormsModule,
    // MDBBootstrapModule.forRoot()
  ],
  providers: [{provide: APP_BASE_HREF, useValue : '/' }],
  bootstrap: [AppComponent]
})
export class AppModule { }
