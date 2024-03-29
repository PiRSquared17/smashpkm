package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Beasiswa;
import model.Pengajuan;

/**
 *
 * @author yosua
 */
public class DispatcherPengajuan extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParseException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String page = request.getParameter("page");
        RequestDispatcher dis = null;
        ControllerPengajuan controller = new ControllerPengajuan(request);
        ControllerBeasiswa controllerBsw = new ControllerBeasiswa(request);
        Pengajuan pengajuan = new Pengajuan();
        String pesan = " ";
        request.setAttribute("pesan", pesan);


        if (page != null) {
        if (page.equals("statusBeasiswa")) {//melakukan list pengajuan selain yang berstatus "daftar"
                controller.setListStatusByNrp();
                dis = request.getRequestDispatcher("statusBeasiswa.jsp");
            }

            if (page.equals("listDaftarBeasiswa")) {//melakuakn list pengajuan berdasarkan nrp member
                controllerBsw.setListBeasiswaBerlaku();
                controller.setListPengajuanByNrp();
                dis = request.getRequestDispatcher("listDaftarBeasiswa.jsp");

            }
            if (page.equals("goDaftarBeasiswa")) {//membuat pengajuan baru
                dis = request.getRequestDispatcher("CommonsFileUploadServlet");
            }
            if (page.equals("listRekapitulasi")) {
                controller.setStatusPenerima(); //automasi pemeriksaan kadaluarsa pengajuan yang berstatus "terima"
                controllerBsw.setListBeasiswa();//list beasiswa untuk filtering
                controller.setListPengajuan();//list pengajuan yang ada
                dis = request.getRequestDispatcher("halamanRekapitulasi.jsp");
            }
            if (page.equals("goListRekapitulasi")) {
                controller.setListPengajuanByIdBeasiswa();//melakukan sorting dari pengajuan berdasarkan idbeasiswa
                dis = request.getRequestDispatcher("halamanRekapitulasi.jsp");
            }
            if (page.equals("aturRekapitulasi")) {//mencari data dari pengajuan yang akan di rekap berdasarkan nrp member
                controller.setPengajuan();
                dis = request.getRequestDispatcher("halamanDownloadRekapitulasi.jsp");
            }
            if (page.equals("aturStatus")) {//menyimpan perubahan status dari pengajuan dan mahasiswa/member
                controller.setAturStatus();
                controller.setPengajuan();
                dis = request.getRequestDispatcher("halamanDownloadRekapitulasi.jsp");
            }

        } else {
            dis = request.getRequestDispatcher("index.jsp");
        }
        dis.include(request, response);

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(DispatcherMahasiswa.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(DispatcherMahasiswa.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
