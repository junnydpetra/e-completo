<nav class="navbar navbar-dark fixed-top bg-dark flex-md-nowrap p-0 shadow">
  <a class="navbar-brand col-sm-3 col-md-2 mr-0" href="#">E-Completo</a>
</nav>

<div class="container-fluid">
  <div class="row">
    <nav class="col-md-2 d-none d-md-block bg-light sidebar">
      <div class="sidebar-sticky">
        <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
          <span>Menu</span>
          <a class="d-flex align-items-center text-muted" href="#" aria-label="Add a new report">
            <span data-feather="plus-circle"></span>
          </a>
        </h6>
        <ul class="nav flex-column">

            <li class="nav-item">
              <a class="nav-link" href="<?= base_url() ?>dashboard">
                <span data-feather="file"></span>
                Dashboard
              </a>

            </li>
            <li class="nav-item">
              <a class="nav-link" href="<?= base_url() ?>clientes">
                <span data-feather="file"></span>
                Clientes
              </a>
            </li>

            <li class="nav-item">
              <a class="nav-link" href="<?= base_url() ?>pedidos">
                <span data-feather="shopping-cart"></span>
                Pedidos
              </a>
            </li>
					
        </ul>

      </div>
    </nav>
