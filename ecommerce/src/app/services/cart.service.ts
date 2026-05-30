import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { BehaviorSubject } from 'rxjs';
import { URL_SERVICIOS } from '../config/config';

@Injectable({
  providedIn: 'root'
})
export class CartService {

  private totalItems = new BehaviorSubject<number>(0);
  totalItems$ = this.totalItems.asObservable();

  constructor(private http: HttpClient) {}

  private headers() {
    const token = localStorage.getItem('token') || '';
    return new HttpHeaders({ 'Authorization': 'Bearer ' + token });
  }

  getCarts() {
    return this.http.get(URL_SERVICIOS + '/ecommerce/carts', { headers: this.headers() });
  }

  addCart(data: any) {
    return this.http.post(URL_SERVICIOS + '/ecommerce/carts', data, { headers: this.headers() });
  }

  updateCart(id: number, quantity: number) {
    return this.http.put(URL_SERVICIOS + '/ecommerce/carts/' + id, { quantity }, { headers: this.headers() });
  }

  removeCart(id: number) {
    return this.http.delete(URL_SERVICIOS + '/ecommerce/carts/' + id, { headers: this.headers() });
  }

  clearCart() {
    return this.http.delete(URL_SERVICIOS + '/ecommerce/carts/delete_all', { headers: this.headers() });
  }

  setTotalItems(n: number) {
    this.totalItems.next(n);
  }
}
