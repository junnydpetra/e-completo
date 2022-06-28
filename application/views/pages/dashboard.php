				<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
					<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
						<h1 class="h2">Dashboard</h1>
					</div>

					<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
						<h2 class="h2">Clientes</h2>
					</div>

					<div class="table-responsive">
						<table class="table table-bordered table-hover">
							
							<thead>
								<tr>
									<th>id</th>
									<th>Nome</th>
									<th>CPF/CNPJ</th>
									<th>E-Mail</th>
									<th>Tipo de Pessoa</th>
									<th>Nascimento</th>
									<th>id_loja</th>
								</tr>
							</thead>
							
							<tbody>
								<?php foreach($clientes as $cliente) : ?>
									<tr>
										<td><?= $cliente['id']?></td>
										<td><?= $cliente['nome']?></td>
										<td><?= $cliente['cpf_cnpj']?></td>
										<td><?= $cliente['email']?></td>
										<td><?= $cliente['tipo_pessoa']?></td>
										<td><?= $cliente['data_nasc']?></td>
										<td><?= $cliente['id_loja']?></td>
									</tr>
								<?php endforeach;?>
							</tbody>

						</table>
					</div>
				</main>