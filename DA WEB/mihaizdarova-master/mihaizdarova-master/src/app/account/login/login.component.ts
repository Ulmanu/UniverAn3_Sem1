import { Component, OnInit } from '@angular/core';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';
import {ActivatedRoute, Router} from '@angular/router';
import {first} from 'rxjs/operators';
declare var $: any;
@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss']
})
export class LoginComponent implements OnInit {

  form: FormGroup;
  loading = false;
  submitted = false;

  constructor(
    private formBuilder: FormBuilder,
    private route: ActivatedRoute,
    private router: Router,
  ) { }

  ngOnInit(): any {
    this.form = this.formBuilder.group({
      email: ['', [Validators.required, Validators.email, Validators.pattern('^[a-zA-Z0-9._%+-]+@[a-z0-9.-]+\\.[a-z]{2,4}$')]],
      password: ['', [Validators.required, Validators.minLength(4)]]
    });

    $(document).ready(function(){

      $('.input').focus(function(){
        $(this).parent().find(".label-txt").addClass('label-active');
      });

      $(".input").focusout(function(){
        if ($(this).val() == '') {
          $(this).parent().find(".label-txt").removeClass('label-active');
        };
      });

    });
  }

  // convenience getter for easy access to form fields
  get f(): any { return this.form.controls; }

  onSubmit(): any {
    this.submitted = true;


    this.loading = true;

  }

}
