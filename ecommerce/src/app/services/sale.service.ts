import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { URL_SERVICIOS } from '../config/config';

@Injectable({
  providedIn: 'root'
})
export class SaleService {

  constructor(private http: HttpClient) {}

  private headers() {
    const token = localStorage.getItem('token') || '';
    return new HttpHeaders({ 'Authorization': 'Bearer ' + token });
  }

  createSale(data: any) {
    return this.http.post(URL_SERVICIOS + '/ecommerce/sales', data, { headers: this.headers() });
  }

  getSales() {
    return this.http.get(URL_SERVICIOS + '/ecommerce/sales', { headers: this.headers() });
  }

  getSale(id: number) {
    return this.http.get(URL_SERVICIOS + '/ecommerce/sales/' + id, { headers: this.headers() });
  }
}
