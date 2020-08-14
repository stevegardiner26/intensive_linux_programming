<?php
    $host = "localhost";
    $username = "cs288";
    $password = "cs288pw";
    $database = "stock_market";

    $order_by = $_GET["order_by"];
    $sorting = $_GET["sorting"];
    
    // Create a new connection
    $conn = new mysqli($host, $username, $password, $database);

    if ($conn->connect_error) {
        die("Connection Failed: " . $conn->connect_error);
    }

    // Did not know what table to load in so I just hardcoded it.
    $table_name = "yahoo_2020_07_28_18_44_21";
    
    $sql = "SELECT * FROM $table_name";

    if ($order_by && $sorting) {
        $sql = "SELECT * FROM $table_name ORDER BY $order_by $sorting";
    }
    $result = $conn->query($sql);
    
    $conn->close();
?>

<h1>
    <?php echo $table_name ?>
</h1>

<p>(Volume in M, Market Cap in B)</p>

<table>
    <thead>
        <th><a href="?order_by=symbol&sorting=<?php if ($order_by == "symbol" && $sorting != "desc") { echo "desc"; } else { echo "asc"; }?>">symbol</a></th>
        <th><a href="?order_by=name&sorting=<?php if ($order_by == "name" && $sorting != "desc") { echo "desc"; } else { echo "asc"; }?>">name</a></th>
        <th><a href="?order_by=price&sorting=<?php if ($order_by == "price" && $sorting != "desc") { echo "desc"; } else { echo "asc"; }  ?>">price</a></th>
        <th><a href="?order_by=chng&sorting=<?php if ($order_by == "chng" && $sorting != "desc") { echo "desc"; } else { echo "asc"; }  ?>">chng</a></th>
        <th><a href="?order_by=p_change&sorting=<?php if ($order_by == "p_change" && $sorting != "desc") { echo "desc"; } else { echo "asc"; }  ?>">p_change</a></th>
        <th><a href="?order_by=volume&sorting=<?php if ($order_by == "volume" && $sorting != "desc") { echo "desc"; } else { echo "asc"; }  ?>">volume</a></th>
        <th><a href="?order_by=market_cap&sorting=<?php if ($order_by == "market_cap" && $sorting != "desc") { echo "desc"; } else { echo "asc"; }  ?>">market_cap</a></th>
    </thead>
    <tbody>
        <?php
            if ($result->num_rows > 0) {
                // output data of each row
                while($row = $result->fetch_assoc()) {
                    echo "<tr><td>" . $row["symbol"]. "</td><td>" . $row["name"]. "</td><td>" . $row["price"] . "</td><td>" . $row["chng"] . "</td><td>" . $row["p_change"] . "</td><td>" . $row["volume"] . "</td><td>" . $row["market_cap"] . "</td></tr>";
                }
            } else {
                echo "0 results";
            }
        ?>
    </tbody>
</table>

<style>
    table, tr, td, th {
        border: 1px solid black;
    }
</style>