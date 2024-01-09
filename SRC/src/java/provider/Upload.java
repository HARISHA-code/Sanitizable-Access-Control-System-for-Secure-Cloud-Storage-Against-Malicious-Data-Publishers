package provider;

import DB.DB;
import algorithm.CipherHelper;
import algorithm.Stem;
import algorithm.Stopwords;
import algorithm.TFIDFCalculator;
import cloud.SimpleFTPClient;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Random;
import java.util.Set;
import java.util.concurrent.TimeUnit;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class Upload extends HttpServlet {

    String fna = "";
    String fdo = "", content = "";
    String b1, b2, b3;

    int hashh;
    static String wordcon = "";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, InterruptedException {
        response.setContentType("text/html;charset=UTF-8");
        hashh = 0;
        long startTime = System.nanoTime();

        TimeUnit.SECONDS.sleep(5);

        // ... the code being measured ends ...

        List<String> ms = new ArrayList<String>();
        String finalimage = "";
        boolean isMultipart = ServletFileUpload.isMultipartContent(request);
        List<String> m = new ArrayList<String>();
        File savedFile;

        if (!isMultipart) {
            float dummy = (float) Math.log(0) + 1;

        } else {
            FileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);
            List items = null;

            try {
                items = upload.parseRequest(request);
                //System.out.println("items: "+items);
            } catch (FileUploadException e) {
                e.printStackTrace();
            }
            Iterator itr = items.iterator();
            while (itr.hasNext()) {
                List<String> al = new ArrayList<String>();

                String sss = "";
                FileItem item = (FileItem) itr.next();
                String value = "";
                String a[];
                if (item.isFormField()) {
                    String name = item.getFieldName();
                    //System.out.println("name: "+name+'\n');
                    value = item.getString();
                    // System.out.println("value: "+value);
                    al.add(value);
                    for (int i = 0; i < al.size(); i++) {
                        sss += al.get(i);
                        System.out.println("is this image" + sss);

                        //System.out.println("the value sixcwe"+m.size());
                    }

                    a = sss.split("-");
                    for (int i = 0; i < a.length; i++) {

                        String am = a[i];
                        System.out.println("aaaaaaaaaaaaaaaa" + a[i]);
                        m.add(a[i]);
                    }
                } else {

                    String itemName = item.getName();

                    String reg = "[.*]";
                    String replacingtext = "";
                    Pattern pattern = Pattern.compile(reg);
                    Matcher matcher = pattern.matcher(itemName);
                    StringBuffer buffer = new StringBuffer();

                    while (matcher.find()) {
                        matcher.appendReplacement(buffer, replacingtext);
                    }
                    int IndexOf = itemName.indexOf(".");
                    int Indexf = itemName.indexOf(".");
                    String domainName = itemName.substring(IndexOf);

                    finalimage = buffer.toString() + domainName;

                    System.out.println("hi..... " + domainName);
                    System.out.println("Final Image===" + finalimage);
                    ms.add(finalimage);
                    fna = buffer.toString();
                    fdo = domainName;
                    savedFile = new File("C:\\files\\" + finalimage);
                    try {
                        item.write(savedFile);

                        CipherHelper c = new CipherHelper();
                        File path = new File("C:\\files\\" + finalimage);
                        File path1 = new File("C:\\files\\enc\\" + finalimage);

                        BufferedReader br = null;

                        String sCurrentLine;
                        StringBuilder b = new StringBuilder();
                        StringBuilder bb = new StringBuilder();
                        br = new BufferedReader(new FileReader("C:\\files\\" + finalimage));
                        while ((sCurrentLine = br.readLine()) != null) {
                            bb.append(sCurrentLine);
                            String myAppContext = sCurrentLine;
                        }
                        String rep = bb.toString().replaceAll("( )+", " ");
                        content = rep;
                        String enc = c.cipher(m.get(1), content);
                        String renc = c.cipher(m.get(1), enc);
                        PrintWriter writer = new PrintWriter("C:\\files\\enc\\" + finalimage, "UTF-8");
                        writer.println(enc);
                        writer.close();
                        PrintWriter writer1 = new PrintWriter("C:\\files\\enc\\renc\\" + finalimage, "UTF-8");
                        writer1.println(renc);
                        writer1.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    try {
                        SimpleFTPClient client = new SimpleFTPClient();
                        client.setHost("ftp.drivehq.com");
                        client.setUser("harishsm");
                        client.setPassword("Hari5h@123");
                        client.setRemoteFile(finalimage);
                        boolean log = client.connect();
                        if (log) {
                            try {
                                System.out.println("this is log true block");
                                FileOutputStream fos = new FileOutputStream(new File(item.getName()));
                                byte b[] = new byte[1024];
                                int c = 0;
                                InputStream is = item.getInputStream();
                                while ((c = is.read(b)) != -1) {
                                    fos.write(b, 0, c);
                                }
                                fos.close();
                                System.out.println("this is log true block executed");
                            } catch (Exception e) {
                                System.out.println("this is log false block    " + e);
                            }
                            PrintWriter out = response.getWriter();

                            FileOutputStream fos = new FileOutputStream(new File(item.getName()));
                            try {
                                FileInputStream fis = new FileInputStream(new File(item.getName()));
                                boolean success = client.uploadFile(new File(item.getName()));
                                fis.close();

                                if (success) {
                                    System.out.println("This is a true block");
                                } else {
                                    System.out.println("Upload failed!");
                                }
                            } catch (IOException e) {
                                e.printStackTrace();
                                // Handle the exception if needed
                            }

                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                        System.out.println("not bad-----------");
                    }

                }
            }
        }
        Stopwords ss = new Stopwords();
        LinkedList<String> stop = new LinkedList<String>();
        stop = ss.words(content);
        String result1 = "";
        for (String zob : stop) {
            result1 += zob + " ";
        }
        result1 = result1.replaceAll("[,]", " ");
        replace rep = new replace();
        result1 = rep.remove(result1);
        Stem sn = new Stem();
        LinkedList<String> kk = new LinkedList<String>();
        kk = sn.stem(result1);
        String result2 = kk.toString().replaceAll("[,]", "");
        TFIDFCalculator tf = new TFIDFCalculator();
        tf.tf(kk, content);
        String strQuery = "";
        String tfvalue = "";
        Set<String> unique = new HashSet<String>(kk);
        for (String key : unique) {
            int zz = Collections.frequency(kk, key);
            tfvalue += key + " : " + zz;
            tfvalue += " \n";
        }
        System.out.println("Number of Frequent List");
        long endTime = System.nanoTime();

        long timeElapsed = endTime - startTime;

        System.out.println("Execution time in nanoseconds: " + timeElapsed);
        System.out.println("Execution time in milliseconds: " + timeElapsed / 1000000);
        long timedelay = timeElapsed / 1000000;
        long tput = timeElapsed;
        //System.out.println(tfvalue);
        PrintWriter out = response.getWriter();
        PreparedStatement ps, ps1;
        System.out.println("completed.....");
        try {
            Connection con = new DB().Connect();
            strQuery = "insert into file (id,oname,fname,fkey,date,trapdoor,content,sto,ste,tf,timedelay,tput) "
                    + "values('" + m.get(0) + "','" + m.get(1) + "','" + ms.get(0) + "','" + m.get(2) + "','" + m.get(3) + "','" + m.get(4) + "','" + content + "','" + result1 + "','" + result2 + "','" + tfvalue + "','" + timedelay + "','" + tput + "')";
            ps = con.prepareStatement(strQuery);
            ps.executeUpdate(strQuery);
            HttpSession session = request.getSession();
            session.setAttribute("sto", result1);
            session.setAttribute("ste", result2);
            session.setAttribute("tf", tfvalue);
            content = "";
            out.println("<script>" + "alert('File uploaded successfully')" + "</script>");
            RequestDispatcher rd = request.getRequestDispatcher("Upload_Files.jsp");
            rd.include(request, response);
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (InterruptedException ex) {
            Logger.getLogger(Upload.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (InterruptedException ex) {
            Logger.getLogger(Upload.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
