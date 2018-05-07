<!-- =============================================== -->

<!-- Left side column. contains the sidebar -->
<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
        <!-- Sidebar user panel -->
        <div class="user-panel">
            <div class="pull-left image">
                <img src="{{ asset('img/user2-160x160.jpg') }}" class="img-circle" alt="User Image">
            </div>
            <div class="pull-left info">
                <p>{{ $user->name }}</p>
                <a href="{{ route('admin.employee.profile', $user->id) }}"><span>Administrador</span> <i class="fa fa-circle text-success"></i> Online</a>
            </div>
        </div>
        <!-- sidebar menu: : style can be found in sidebar.less -->
        <ul class="sidebar-menu">
            <li class="header">Inicio</li>
            <li>
                <li class="treeview @if(request()->segment(2) == 'products') active @endif">
                    <a href="{{ route('admin.dashboard') }}">
                        <i class="fa fa-home"></i> <span>Dashboard</span>
                        <span class="pull-right-container">
                                <i class="fa fa-angle-left pull-right"></i>
                        </span>
                    </a>
                </li>
            </li>
            @if($admin == 1 || $admin == 2)                
                <li class="header">Entregas</li>
                <li class="treeview @if(request()->segment(2) == 'couriers') active @endif">
                    <a href="#">
                        <i class="fa fa-truck"></i> <span>Entregas</span>
                        <span class="pull-right-container">
                                <i class="fa fa-angle-left pull-right"></i>
                        </span>
                    </a>
                    <ul class="treeview-menu">
                        <li><a href="{{ route('admin.couriers.index') }}"><i class="fa fa-circle-o"></i> Lista de entregas</a></li>
                        <li><a href="{{ route('admin.couriers.create') }}"><i class="fa fa-plus"></i> Criar entrega</a></li>
                    </ul>
                </li>
                <li class="header">Pedidos</li>
                <li class="treeview @if(request()->segment(2) == 'orders') active @endif">
                    <a href="#">
                        <i class="fa fa-money"></i> <span>Pedidos</span>
                        <span class="pull-right-container">
                                <i class="fa fa-angle-left pull-right"></i>
                        </span>
                    </a>
                    <ul class="treeview-menu">
                        <li><a href="{{ route('admin.orders.index') }}"><i class="fa fa-circle-o"></i> List orders</a></li>
                    </ul>
                </li>
                <li class="treeview @if(request()->segment(2) == 'order-statuses') active @endif">
                    <a href="#">
                        <i class="fa fa-anchor"></i> <span>Estatus Pedidos</span>
                        <span class="pull-right-container">
                                <i class="fa fa-angle-left pull-right"></i>
                        </span>
                    </a>
                    <ul class="treeview-menu">
                        <li><a href="{{ route('admin.order-statuses.index') }}"><i class="fa fa-circle-o"></i> Lista de estatus</a></li>
                        <li><a href="{{ route('admin.order-statuses.create') }}"><i class="fa fa-plus"></i> Criar novo estatus</a></li>
                    </ul>
                </li>
            @endif
            @if($admin == 1)
                <li class="header">Produtos</li>
                <li class="treeview @if(request()->segment(2) == 'products') active @endif">
                    <a href="#">
                        <i class="fa fa-gift"></i> <span>Produtos</span>
                        <span class="pull-right-container">
                                <i class="fa fa-angle-left pull-right"></i>
                        </span>
                    </a>
                    <ul class="treeview-menu">
                        <li><a href="{{ route('admin.products.index') }}"><i class="fa fa-circle-o"></i> Lista produtos</a></li>
                        <li><a href="{{ route('admin.products.create') }}"><i class="fa fa-plus"></i> Criar produto</a></li>
                    </ul>
                </li>
                <li class="treeview @if(request()->segment(2) == 'categories') active @endif">
                    <a href="#">
                        <i class="fa fa-folder"></i> <span>Categorias</span>
                        <span class="pull-right-container">
                                <i class="fa fa-angle-left pull-right"></i>
                        </span>
                    </a>
                    <ul class="treeview-menu">
                        <li><a href="{{ route('admin.categories.index') }}"><i class="fa fa-circle-o"></i> Lista de categorias</a></li>
                        <li><a href="{{ route('admin.categories.create') }}"><i class="fa fa-plus"></i> Criar categoria</a></li>
                    </ul>
                </li>
                <li class="header">CONFIG</li>
                <li class="treeview @if(request()->segment(2) == 'employees') active @endif">
                    <a href="#">
                        <i class="fa fa-star"></i> <span>Administradores</span>
                        <span class="pull-right-container">
                                <i class="fa fa-angle-left pull-right"></i>
                        </span>
                    </a>
                    <ul class="treeview-menu">
                        <li><a href="{{ route('admin.employees.index') }}"><i class="fa fa-circle-o"></i> Lista de ADMs</a></li>
                        <li><a href="{{ route('admin.employees.create') }}"><i class="fa fa-plus"></i> Criar ADM</a></li>
                    </ul>
                </li>
                <li class="treeview @if(request()->segment(2) == 'customers' || request()->segment(2) == 'addresses') @endif">
                    <a href="#">
                        <i class="fa fa-user"></i> <span>Clientes</span>
                        <span class="pull-right-container">
                                <i class="fa fa-angle-left pull-right"></i>
                        </span>
                    </a>
                    <ul class="treeview-menu">
                        <li><a href="{{ route('admin.customers.index') }}"><i class="fa fa-circle-o"></i> Lista de clientes</a></li>
                        <li><a href="{{ route('admin.customers.create') }}"><i class="fa fa-plus"></i> Criar cliente</a></li>
                    </ul>
                </li>
                <li class="@if(request()->segment(2) == 'addresses') active @endif">
                    <a href="#"><i class="fa fa-map-marker"></i> Endereços
                        <span class="pull-right-container">
                          <i class="fa fa-angle-left pull-right"></i>
                        </span>
                    </a>
                    <ul class="treeview-menu">
                        <li><a href="{{ route('admin.addresses.index') }}"><i class="fa fa-circle-o"></i> Lista de endereços</a></li>
                        <li><a href="{{ route('admin.addresses.create') }}"><i class="fa fa-plus"></i> Criar endereço</a></li>
                    </ul>
                </li>
                <li class="treeview @if(request()->segment(2) == 'countries' || request()->segment(2) == 'provinces') active @endif">
                    <a href="#">
                        <i class="fa fa-flag"></i> <span>Paises</span>
                        <span class="pull-right-container">
                                <i class="fa fa-angle-left pull-right"></i>
                        </span>
                    </a>
                    <ul class="treeview-menu">
                        <li><a href="{{ route('admin.countries.index') }}"><i class="fa fa-circle-o"></i> Lista</a></li>
                    </ul>
                </li>
                <li class="treeview @if(request()->segment(2) == 'attributes') active @endif">
                    <a href="#">
                        <i class="fa fa-gear"></i> <span>Atributos</span>
                        <span class="pull-right-container">
                                <i class="fa fa-angle-left pull-right"></i>
                        </span>
                    </a>
                    <ul class="treeview-menu">
                        <li><a href="{{ route('admin.attributes.index') }}"><i class="fa fa-circle-o"></i> Lista de atributos</a></li>
                        <li><a href="{{ route('admin.attributes.create') }}"><i class="fa fa-plus"></i> Criar atributo</a></li>
                    </ul>
                </li>
            @endif
        </ul>
    </section>
    <!-- /.sidebar -->
</aside>

<!-- =============================================== -->