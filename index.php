<?php

// 0. SESSION開始！！
session_start();

// 関数群の読み込み
include("funcs.php");
sessionCheck();

//1.  DB接続します
$pdo = db_conn();
// try {
//   //ID MAMP ='root'
//   //Password:MAMP='root',XAMPP=''
//   $pdo = new PDO('mysql:dbname=php02_kadai;charset=utf8;host=localhost','root','root');
// } catch (PDOException $e) {
//   exit('DBConnectError:'.$e->getMessage());
// }

//２．タイトルデータ取得SQL作成
$stmt = $pdo->prepare("SELECT * FROM title_table");
$status = $stmt->execute();

//３．タイトルデータ表示
$view="";
if ($status == false) {
    //execute（SQL実行時にエラーがある場合）
  $error = $stmt->errorInfo();
  exit("ErrorQuery:".$error[2]);
}else{
  //Selectデータの数だけ自動でループしてくれる
  //FETCH_ASSOC=http://php.net/manual/ja/pdostatement.fetch.php
  while( $result = $stmt->fetch(PDO::FETCH_ASSOC)){
    $view .= "<li class='title'>";
    $view .= '<a href="index.php?title_id=' . $result["id"] . '">';
    $view .= $result['title'];
    $view .= '</a>';
    $view .= "</li>";
  }
}
// GETによるtitle_idの値があるかを確認してからテキストに関する処理を実行
if(isset($_GET['title_id'])){
    // echo("ある");
    // ４．テキストデータ取得
    $title_id = $_GET['title_id'];
    $stmt = $pdo->prepare("SELECT * FROM text_table WHERE title_id=". $title_id);
    $status = $stmt->execute();
    // var_dump($stmt->fetch(PDO::FETCH_ASSOC));

    // ５．テキストデータ表示
    $text_view="";
    if ($status == false) {
        //execute（SQL実行時にエラーがある場合）
    $error = $stmt->errorInfo();
    exit("ErrorQuery:".$error[2]);

    }else{
        //Selectデータの数だけ自動でループしてくれる
        //FETCH_ASSOC=http://php.net/manual/ja/pdostatement.fetch.php
        while( $result = $stmt->fetch(PDO::FETCH_ASSOC)){
            $text_view .= "<p class='p_header'>名前：";
            $text_view .= $result['name'];
            $text_view .= '　　　　　書き込み日時：'. $result['indate']. '<br>';
            $text_view .= $result['text'];
            $text_view .= "</p>";
        }
    }
}
?>



<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>掲示板アプリ</title>
    <!-- CSS読み込み -->
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/style.css">
    <!-- JQuery読み込み -->
    <script src="js/jquery-2.1.3.min.js"></script>
    

</head>
<header>
    <div class="sidebar_head">
        <div class="sidebar_head_text">スレッド一覧</div>
    </div>
    <div class="main_column_head">
        <div class="main_column_head_text">スレッド内容</div>
    </div>
</header>
<body>
    <main>
        <div class="sidebar">
            <div class="title_output">
                <ul class="sidebar_title_list" id="sidebar_title_list">
                    <?= $view ?>
                </ul>
            </div>
        </div> 
        <div class="main_column"> 
            <div class="main_column_output" id="main_column_output">
                <?= $text_view ?>
                
            </div>
        </div>
    </main>
</body>
<footer>
    <form method="post" action="insert_title.php">
        <div class="sidebar_make_title">
            <div class="sidebar_make_title_text">スレッド作成</div>
            <input type="text" id="input_title" name="title">
            <div class="make_title_send_wrapper">
                <input type="submit" value="スレッド作成">
                <!-- <button id="make_title_send">タイトル作成</button> -->
            </div>
        </div>
    </form>
    <form method="post" action="insert_text.php">
        <div class="main_column_make_text">
            <div>名前：<input type="text" id="uname" name="name"></div>
            <textarea id="text" cols="150" rows="4" name="text"></textarea>
            <input type="hidden" name="title_id" value=<?= $title_id ?>>
            <div class="make_text_send_wrapper">
                <input type="submit" value="テキスト送信">
                <!-- <button id="make_text_send">送信</button> -->
            </div>
        </div>
    </form>
</footer>

<script>
    //スレッドタイトルのidを記憶する変数
    // let title_id = null

    // スレッドタイトルのクリック処理
    // $(document).on('click', '.title', function() { //$(document).on('click', 'セレクタ', function() {
    //     console.log('クリック');
    //     let k = $(this).attr('id');
    //     console.log(k);
    //     title_id = k
    //     const ref_title_id = firebase.database().ref(title_id);
    //     console.log(ref_title_id);
    //     // スレッドの表示内容をクリア
    //     $("#main_column_output").empty();
        
    //     // スレッド内容を表示
    //     db.ref(title_id).on("child_added",function(data){
    //         const v = data.val(); //ここの.val()はfirebaseの書き方 送信されたオブジェクトを取得
    //         if(typeof v.uname !== 'undefined'){
    //             const h = '<p class="p_header">名前：'+v.uname+'　　　　　書き込み日時：'+v.make_text_time+'</p><p>'+v.text+'</p>';
    //             console.log(data);
    //             $("#main_column_output").append(h);
    //         }
    //     });
    // });

    //スレッド内テキストを送信

</script>