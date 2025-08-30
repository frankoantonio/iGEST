import { CommonModule } from '@angular/common';
import { Component, inject, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-error-page',
  imports: [CommonModule],
  templateUrl: './error-page.html',
  styleUrl: './error-page.css'
})
export class ErrorPage implements OnInit {

  protected errorMessage: string = 'Error desconocido de conexión';
  private route = inject(ActivatedRoute);

  ngOnInit(): void {
    this.route.queryParams.subscribe(params => {
      if (params['message']) {
        this.errorMessage = params['message'];
      }
    });
  }

}