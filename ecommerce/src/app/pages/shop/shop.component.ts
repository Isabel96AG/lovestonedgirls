import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterLink, ActivatedRoute } from '@angular/router';
import { FormsModule } from '@angular/forms';
import { EcommerceService } from '../../services/ecommerce.service';

@Component({
  selector: 'app-shop',
  standalone: true,
  imports: [CommonModule, RouterLink, FormsModule],
  templateUrl: './shop.component.html',
  styleUrl: './shop.component.scss'
})
export class ShopComponent implements OnInit {

  productos: any[] = [];
  categorias: any[] = [];
  total: number = 0;
  paginaActual: number = 1;
  busqueda: string = '';
  categoriaSeleccionada: any = '';

  ordenar: string = '';

  constructor(
    private ecommerceService: EcommerceService,
    private route: ActivatedRoute
  ) {}

  ngOnInit() {
    this.ecommerceService.getHome().subscribe((resp: any) => {
      this.categorias = resp.categories;
    });

    this.route.queryParams.subscribe(params => {
      this.categoriaSeleccionada = params['categorie_id'] || '';
      this.busqueda = params['search'] || '';
      this.cargarProductos();
    });
  }

  cargarProductos() {
    this.ecommerceService.getProducts(this.paginaActual, this.busqueda, this.categoriaSeleccionada).subscribe((resp: any) => {
      this.productos = resp.products;
      this.total = resp.total;
      this.aplicarOrden();
    });
  }

  aplicarOrden() {
    if (this.ordenar === 'precio-asc') {
      this.productos = [...this.productos].sort((a, b) => parseFloat(a.price) - parseFloat(b.price));
    } else if (this.ordenar === 'precio-desc') {
      this.productos = [...this.productos].sort((a, b) => parseFloat(b.price) - parseFloat(a.price));
    }
  }

  filtrarPorCategoria(id: any) {
    this.categoriaSeleccionada = id;
    this.paginaActual = 1;
    this.cargarProductos();
  }

  buscar() {
    this.paginaActual = 1;
    this.cargarProductos();
  }

  get totalPaginas(): number {
    return Math.ceil(this.total / 12);
  }

  cambiarPagina(pagina: number) {
    if (pagina < 1 || pagina > this.totalPaginas) return;
    this.paginaActual = pagina;
    this.cargarProductos();
    window.scrollTo(0, 0);
  }
}
