<?php 
  include_once 'Views/Template/header.php';
  $alumnos = $data['alumnos'];
?>
<div class="container">
  <h4>Sistema de notas</h4><br>
  <pre>
  <?php 
    // print_r($alumnos);
  ?>
  </pre>
  
  <table class="table">
    <thead>
      <tr class="text-center">
        <th scope="col">#</th>
        <th scope="col">APELLIDOS Y NOMBRES</th>
        <th scope="col">N1</th>
        <th scope="col">N2</th>
        <th scope="col">N3</th>
        <th scope="col">P1</th>
        <th scope="col">N1</th>
        <th scope="col">N2</th>
        <th scope="col">N3</th>
        <th scope="col">P2</th>
        <th scope="col">PF</th>
      </tr>
    </thead>
    <tbody>
      <?php
      foreach ($alumnos as $key => $alumno) {
        $comp1 = round((($alumno['notas'][0] + $alumno['notas'][1] + $alumno['notas'][2]) / 3),0);
        $comp2 = round((($alumno['notas'][3] + $alumno['notas'][4] + $alumno['notas'][5]) / 3),0);
      ?>
      <tr id="row<?= $alumno['id'] ?>">
        <th scope="row"><?= $key+1 ?></th>
        <td style="width: 23%;"><?= $alumno['nombres'] ?></td>
        <td><input class="form-control nota1"  type="number" name="nota1[]" id="n1a" value="<?= $alumno['notas'][0] ?>"></td>
        <td><input class="form-control nota1"  type="number" name="nota1[]" id="n2a" value="<?= $alumno['notas'][1] ?>"></td>
        <td><input class="form-control nota1"  type="number" name="nota1[]" id="n3a" value="<?= $alumno['notas'][2] ?>"></td>
        <td class="p1"><?= $comp2 ?></td>
        <td><input class="form-control nota2"  type="number" name="nota2[]" id="n1b" value="<?= $alumno['notas'][3] ?>"></td>
        <td><input class="form-control nota2"  type="number" name="nota2[]" id="n2b" value="<?= $alumno['notas'][4] ?>"></td>
        <td><input class="form-control nota2"  type="number" name="nota2[]" id="n3b" value="<?= $alumno['notas'][5] ?>"></td>
        <td class="p2"><?= $comp1 ?></td>
        <td class="pf"><?= round((($comp1 + $comp2) / 2),0)?></td>
      </tr>
      <?php } ?>
    </tbody>
  </table>
</div>

<?php 
  include_once 'Views/Template/footer.php';
?>