<?php
	require_once("simple_html_dom.php");
	$urls = [];
	$urlsTemp = [];

	$urlsTemp['url'] = "https://www.submarino.com.br/produto/133805849/carrinho-hot-wheels-ultimate-garagem-ftb69-mattel?WT.srch=1&epar=bp_pl_00_go_g35145&gclid=CjwKCAiAodTfBRBEEiwAa1hauoekTen6T_mJsgzEgUwfFKjJ33aQVWEzp0IsYk7gK9nydd8kgfmOBBoCR8UQAvD_BwE&opn=XMLGOOGLE&sellerId=00776574000660";
	$urlsTemp['provedor'] = "submarino";
	$urls[] = $urlsTemp;

	// $urlsTemp['url'] = "https://produto.mercadolivre.com.br/MLB-1134189921-hot-wheels-track-builder-acelerador-conjunto-mattel-_JM?quantity=1";
	// $urlsTemp['provedor'] = "mercado livre";
	// $urls[] = $urlsTemp;

	$data = [];
	
	foreach ($urls as $key => $value) {
		$html = file_get_html($value['url']);			
		
		$dataTemp = [];

		$dataTemp['provedor'] = $value['provedor'];	    	

		if($value['provedor'] == "submarino"){
			$element = $html->find('p[class=sales-price], h1[class=product-name]');	
			$dataTemp['nome_produto'] = $element[0]->plaintext;	    	
			$dataTemp['valor_produto'] = $element[1]->plaintext;	    	  
		}else{			
			$element = $html->find('span[class=price-tag-fraction], span[class=price-tag-cents], title');			
			$dataTemp['nome_produto'] = trim(explode("- R$", $element[0]->plaintext)[0]);			
			$dataTemp['valor_produto'] = trim($element[1]->plaintext).",".trim($element[2]->plaintext);	    	  
		}			

		$data[] = $dataTemp;
	}

	// print("<pre>");print_r($data);

	$servername = "127.0.0.1";
	$database = "robotprice";
	$username = "root";
	$password = "admin123";
	
	$conn = new mysqli($servername, $username, $password, $database);
	
	if ($conn->connect_error) {
	    die("Connection failed: " . $conn->connect_error);
	} 

	
	$obj = [];
	$objTemp = [];

	$sql = "select * from produtos";
	$result = $conn->query($sql);

	if ($result->num_rows > 0) {	    
	    while($row = $result->fetch_assoc()) {
	        $objTemp[$row['produto_id']] = $row;


	        $sql2 = "select * from produtos_variacoes where produto_id = ". $row['produto_id'] ." order by ultima_verificacao ASC";
			$result2 = $conn->query($sql2);

			if ($result2->num_rows > 0) {	    
			    while($row2 = $result2->fetch_assoc()) {
			        $objTemp[$row['produto_id']][] = $row2;
			    }			    
			}

	    }
	    	   
	    $obj = $objTemp;


	}		

	print("<pre>");print_r($obj);


	$conn->close();