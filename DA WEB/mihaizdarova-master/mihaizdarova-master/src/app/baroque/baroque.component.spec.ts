import { ComponentFixture, TestBed } from '@angular/core/testing';

import { BaroqueComponent } from './baroque.component';

describe('BaroqueComponent', () => {
  let component: BaroqueComponent;
  let fixture: ComponentFixture<BaroqueComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ BaroqueComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(BaroqueComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
