import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import {RouterModule, Routes} from '@angular/router';
import {NavbarComponent} from './navbar/navbar.component';
import {LoginComponent} from './account/login/login.component';
import {RegisterComponent} from './account/register/register.component';
import {MenuComponent} from './menu/menu.component';
import {ContemporaryComponent} from './contemporary/contemporary.component';
import {HistoryComponent} from './history/history.component';
import {RenaissanceComponent} from './renaissance/renaissance.component';
import {BaroqueComponent} from './baroque/baroque.component';

const routes: Routes = [
  {path : '', component : MenuComponent},
  {path : 'register', component : RegisterComponent},
  {path : 'login', component : LoginComponent},
  {path : 'contemporary', component : ContemporaryComponent},
  {path : 'history', component : HistoryComponent},
  {path : 'renaissance', component : RenaissanceComponent},
  {path : 'baroque', component : BaroqueComponent},
];


@NgModule({
  declarations: [],
  imports: [
    RouterModule.forRoot(routes),
    CommonModule
  ],
  exports: [
    RouterModule
  ],
})
export class AppRoutingModule { }
