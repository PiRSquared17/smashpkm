<%--
    Document   : pengaturanPassword
    Created on : 01 Dec 11, 08:32:45
    Author     : Danang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <link rel='icon' href="images/favicon.ico" />
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Pengaturan Akun-SMASH</title>
        <meta name="keywords" content="Chrome Web Design, CSS, HTML, free template, piecemaker" />
        <meta name="description" content="Chrome Web Design is a free website template integrated with PieceMaker 3D Flash Slider." />
        <link href="templatemo_style.css" rel="stylesheet" type="text/css" />

        <script type="text/javascript" src="scripts/swfobject/swfobject.js"></script>
        <script type="text/javascript">
            var flashvars = {};
            flashvars.cssSource = "css/piecemaker.css";
            flashvars.xmlSource = "piecemaker.xml";

            var params = {};
            params.play = "true";
            params.menu = "false";
            params.scale = "showall";
            params.wmode = "transparent";
            params.allowfullscreen = "true";
            params.allowscriptaccess = "always";
            params.allownetworking = "all";

            swfobject.embedSWF('piecemaker.swf', 'piecemaker', '960', '500', '10', null, flashvars,
            params, null);

        </script>

        <link rel="stylesheet" type="text/css" href="css/ddsmoothmenu.css" />

        <script type="text/javascript" src="scripts/jquery.min.js"></script>
        <script type="text/javascript" src="scripts/ddsmoothmenu.js">

            /***********************************************
             * Smooth Navigational Menu- (c) Dynamic Drive DHTML code library (www.dynamicdrive.com)
             * This notice MUST stay intact for legal use
             * Visit Dynamic Drive at http://www.dynamicdrive.com/ for full source code
             ***********************************************/

        </script>

        <script type="text/javascript">

            ddsmoothmenu.init({
                mainmenuid: "templatemo_menu", //menu DIV id
                orientation: 'h', //Horizontal or vertical menu: Set to "h" or "v"
                classname: 'ddsmoothmenu', //class added to menu's outer DIV
                //customtheme: ["#1c5a80", "#18374a"],
                contentsource: "markup" //"markup" or ["container_id", "path_to_menu_file"]
            })
        </script>
        <link rel="stylesheet" media="screen" href="buttonstyle.css"/>
    </head>
    <body>
        <div id="templatemo_wrapper">

            <div id="templatemo_header">

                <img src="images/logo.png"/>

                <div id="templatemo_menu" class="ddsmoothmenu">
                    <ul>
                        <li><a href="DispatcherMahasiswa?page=home&&nrp=${mahasiswa.nrp}">Home</a></li>
                        <li><a href="DispatcherMahasiswa?page=home&&nrp=${mahasiswa.nrp}">Menu Utama</a>
                            <ul>
                                <li><a href="DispatcherMahasiswa?page=pengaturanAkun">Pengaturan Akun</a></li>
                                <li><a href="DispatcherPengajuan?page=statusBeasiswa">Status Beasiswa</a></li>
                                <li><a href="DispatcherBeasiswa?page=beasiswaYangTersedia">List Beasiswa</a></li>
                                <li><a href="DispatcherPengajuan?page=listDaftarBeasiswa">Mendaftar Beasiswa</a></li>
                            </ul>
                        </li>
                        <li><a href="about.html">Panduan</a>
                            <ul>
                                <li><a href="http://www.templatemo.com/page/1">Mengelola Akun</a></li>
                                <li><a href="http://www.templatemo.com/page/2">Melihat Status</a></li>
                                <li><a href="http://www.templatemo.com/page/2">Melihat List Beasiswa</a></li>
                                <li><a href="http://www.templatemo.com/page/2">Mendaftar Beasiswa</a></li>
                            </ul>
                        </li>
                        <li><a href="contact.html">Peraturan</a></li>
                        <li><a href="contact.html">Kontak</a></li>
                    </ul>
                    <br style="clear: left" />
                </div> <!-- end of templatemo_menu -->

            </div> <!-- end of header -->
            <br/>
            <p align="right"><font color="black">Anda login sebagai ${mahasiswa.nama},</font><a style="color: red" href="DispatcherMahasiswa?name=logout">(logout)</a></p>

            <div id="templatemo_main">

                <div class="sb_box">
                    <h3>Ganti Password</h3>
                </div>

                <div class="col_w460 float_l">
                    <div class="cleaner h20"></div>
                    <br/>
                    <h2>SMASH</h2>
                    <h5>Smart Application Scholarhip</h5>
                    <div class="cleaner h20"></div>
                    <h6>Untuk menjaga keamanan data Anda, ubah password Anda secara berkala.
                        Gunakan password minimal 6 karakter yang terdiri dari huruf kapital, huruf kecil, bilangan, dan simbol yang umum.
                        Lebih baik jangan menggunakan tanggal lahir atau hal-hal umum lainnya sebagai password.</h6>
                    <div class="cleaner h20"></div>
                </div>


                <div class="col_w460 float_r">
                    <div class="cleaner h20"></div>
                    <div id="contact_form">

                        <form method='post'  action='DispatcherMahasiswa?page=setPengaturanPassword&&nrp=${mahasiswa.nrp}'>
                            <br/>
                            <fieldset>
                                <table border=0>
                                    <tr>
                                        <td width="25px">
                                        </td>
                                        <td>
                                            <font color="#E56717">
                                                <b><%= request.getAttribute("pesan")%></b>
                                            </font>
                                            <br/>
                                        </td>
                                    </tr>
                                </table>

                                <table>
                                    <tr>
                                        <td width="25px">
                                        </td>
                                        <td>
                                            Password Lama
                                        </td>
                                        <td>
                                            : <input type=text name='password_lama' />
                                        </td>

                                    </tr>
                                    <tr>
                                        <td width="25px">
                                        </td>
                                        <td>
                                            Password Baru
                                        </td>
                                        <td>
                                            : <input type=password name='password_baru' />
                                        </td>

                                    </tr>
                                    <tr>
                                        <td width="25px">
                                        </td>
                                        <td>
                                            Ulangi Passord Baru
                                        </td>
                                        <td>
                                            : <input type=password name='password_baru_ulangi' />
                                        </td>

                                    </tr>

                                </table>
                                <br/>
                                <table>
                                    <tr>
                                        <td width="25px">
                                        </td>
                                        <td>
                                            <input type="submit" class="submit_btn float_l" name="submit" id="submit" value="Simpan"  />
                                        </td>
                                        <td>
                                            <a href="DispatcherMahasiswa?page=pengaturanAkun"><input type="button" class="submit_btn float_r" value="Kembali"/></a>
                                        </td>


                                    </tr>
                                </table>

                            </fieldset>
                        </form>
                    </div>
                </div>
                <div class="cleaner"></div>
            </div>
        </div>
    </body>
</html>