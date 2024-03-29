<%--
    Document   : member
    Created on : Dec 27, 2011, 11:55:18 AM
    Author     : Danang
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <link rel='icon' href="images/favicon.ico" />
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Pengaturan Member-SMASH</title>
        <meta name="keywords" content="Chrome Blog Theme, Web Design, CSS, HTML, free template" />
        <meta name="description" content="Chrome Blog Template is a free website template from templatemo.com" />
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

        <link rel="stylesheet" media="screen" href="buttonstyle.css">

    </head>
    <body>
        <div id="templatemo_wrapper">

            <div id="templatemo_header">

                <img src="images/logo.png">

                <div id="templatemo_menu" class="ddsmoothmenu">
                    <ul>
                        <li><a href="DispatcherMahasiswa?page=home&&nrp=${mahasiswa.nrp}">Home</a></li>
                        <li><a href="DispatcherMahasiswa?page=home&&nrp=${mahasiswa.nrp}">Menu Utama</a>
                            <ul>
                                <li><a href="DispatcherBeasiswa?page=pengaturanPost">Posts</a></li>
                                <li><a href="DispatcherMahasiswa?page=pengaturanMember">Members</a></li>
                                <li><a href="DispatcherPengajuan?page=listRekapitulasi">Rekapitulasi</a></li>
                            </ul>
                        </li>
                        <li><a href="contact.html">Panduan</a></li>
                        <li><a href="contact.html">Kontak</a></li>
                    </ul>
                    <br style="clear: left" />
                </div> <!-- end of templatemo_menu -->

            </div> <!-- end of header -->
            <br/>
            <p align="right"><font color="black">Anda login sebagai ${mahasiswa.nama},</font><a style="color: red" href="DispatcherMahasiswa?name=logout">(logout)</a></p>

            <div class="sb_box">
                <h3>Pengaturan Member</h3>
            </div>

            <div class="col_w280 float_l">
                <img src="images/track_Member.png"/>
            </div>

            <table>
                <tr>
                    <td>
                        <a href="DispatcherMahasiswa?page=buatMember" title="" class="btn medium green">Tambah Member Baru</a>
                    </td>
                </tr>
            </table>

            <br/>
            <table border="1">
                <tr>
                    <td align="center"width="250px">
                        <font color="black"><b> Nama Mahasiswa </b></font>
                    </td>
                    <td align="center" width="80px">
                        <font color="black"><b> NRP </b></font>
                    </td>
                    <td align="center" width="70px">
                        <font color="black"><b> Semester </b></font>
                    </td>
                    <td align="center" width="50px">
                        <font color="black"><b> IPK </b></font>
                    </td>
                    <td align="center" width="100px">
                        <font color="black"><b> Gaji Orang Tua </b></font>
                    </td>
                    <td align="center" width="100px">
                        <font color="black"><b> Status Beasiswa </b></font>
                    </td>
                    <td align="center" width="100px">
                        <font color="black"><b> Action </b></font>
                    </td>
                </tr>
                <c:forEach items="${list_mahasiswa}" var="mhs">
                    <tr>
                        <td>
                            <font color="black">${mhs.nama}</font>
                        </td>
                        <td align="center">
                            <font color="black">${mhs.nrp}</font>
                        </td>
                        <td align="center">
                            <font color="black">${mhs.semester}</font>
                        </td>
                        <td align="center">
                            <font color="black">${mhs.ipk}</font>
                        </td>
                        <td align="center">
                            <font color="black">${mhs.penghasilanayah+mhs.penghasilanibu}</font>
                        </td>
                        <td align="center">
                            <font color="black">${mhs.statuspenerima}</font>
                        </td>
                        <td align="center">
                            <a href="DispatcherMahasiswa?page=editMember&&nrp_member=${mhs.nrp}"><img src="images/Modify.png"/></a>
                            <a href="DispatcherMahasiswa?page=deleteMember&&nrp=${mhs.nrp}"><img src="images/Delete.png" onclick="return confirm('Apakah Anda yakin ingin menghapus Akun ${mhs.nrp}?')"/></a>
                        </td>
                    </tr>
                    <tr>
                    </c:forEach>
            </table>
        </div>
        <div id="templatemo_footer_wrapper">
            <div id="templatemo_footer">
                Copyright © 2011 <a href="#">Smash Inc.</a> | Institut Teknologi Sepuluh Nopember
                <div class="cleaner"></div>
            </div>
        </div>
    </body>
</html>
