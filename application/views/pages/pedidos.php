				<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">

					<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
						<h2 class="h2">Pedidos</h2>
					</div>

					<div class="table-responsive">
						<table class="table table-bordered table-hover">
							
							<thead>
								<tr>
									<th>id</th>
									<th>Valor Total</th>
									<th>Valor - Frete</th>
									<th>Data</th>
									<th>id_cliente</th>
									<th>id_loja</th>
									<th>id_situacao</th>
								</tr>
							</thead>
							
							<tbody>
								<?php foreach($pedidos as $pedido) : ?>
									<tr>
										<td><?= $pedido['id']?></td>
										<td><?= $pedido['valor_total']?></td>
										<td><?= $pedido['valor_frete']?></td>
										<td><?= $pedido['data']?></td>
										<td><?= $pedido['id_cliente']?></td>
										<td><?= $pedido['id_loja']?></td>
										<td><?= $pedido['id_situacao']?></td>
									</tr>
								<?php endforeach;?>
							</tbody>

						</table>
					</div>

				</main>