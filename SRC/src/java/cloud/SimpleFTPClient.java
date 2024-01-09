package cloud;


import java.net.*;
import java.io.*;
import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;

public class SimpleFTPClient 
{

    /** The URL connection object */
    private URLConnection m_client;
    /** The FTP host/server to be connected */
    private String host;
    /** The FTP user */
    private String user;
    /** The FTP user’s password */
    private String password;
    /** The remote file that needs to be uploaded or downloaded */
    private String remoteFile;
    /** The previous error message triggered after a method is called */
    private String erMesg;
    /** The previous success message after any method is called */
    private String succMesg;

    public SimpleFTPClient() {
    }

    /** Setter method for the FTP host/server */
    public void setHost(String host) {
        this.host = host;
    }

    /** Setter method for the FTP user */
    public void setUser(String user) {
        this.user = user;
    }

    /** Setter method for the FTP user’s password */
    public void setPassword(String p) {
        this.password = p;
    }

    /** Setter method for the remote file, this must include the sub-directory path relative
    to the user’s home directory, e.g you’e going to download a file that is within a sub directory
    called "sdir", and the file is named "d.txt", so you shall include the path as "sdir/d.txt"
     */
    public void setRemoteFile(String d) {
        this.remoteFile = d;
    }

    /** The method that returns the last message of success of any method call */
    public synchronized String getLastSuccessMessage() {
        if (succMesg == null) {
            return "";
        }
        return succMesg;
    }

    /** The method that returns the last message of error resulted from any exception of any method call */
    public synchronized String getLastErrorMessage() {
        if (erMesg == null) {
            return "";
        }
        return erMesg;
    }

    /** The method that handles file uploading, this method takes the absolute file path
    of a local file to be uploaded to the remote FTP server, and the remote file will then
    be transfered to the FTP server and saved as the relative path name specified in method setRemoteFile
    @param localfilename – the local absolute file name of the file in local hard drive that needs to
    FTP over
     */
         /** The method to upload an encrypted file to the FTP server */
    public synchronized boolean uploadFile(InputStream is) {
        try {
            // Upload the encrypted file to the FTP server
            FTPClient ftpClient = new FTPClient();
            ftpClient.connect(host);
            ftpClient.login(user, password);
            ftpClient.enterLocalPassiveMode();
            ftpClient.setFileType(FTP.BINARY_FILE_TYPE);

            boolean success = false;

            try {
                OutputStream os = ftpClient.storeFileStream(remoteFile);
                byte[] buffer = new byte[1024];
                int bytesRead;

                while ((bytesRead = is.read(buffer)) >0) {
                    os.write(buffer, 0, bytesRead);
                }

                is.close();
                os.close();

                success = ftpClient.completePendingCommand();
            } catch (IOException e) {
                e.printStackTrace();
            }

            if (success) {
                this.succMesg = "Uploaded encrypted file!";
                System.out.println("Uploaded encrypted file! successfully");
                return true;
            } else {
                this.erMesg = "Upload failed!";
                return false;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            StringWriter sw0 = new StringWriter();
            PrintWriter p0 = new PrintWriter(sw0, true);
            ex.printStackTrace(p0);
            erMesg = sw0.getBuffer().toString();
            return false;
        }
    }


    /** The method to download a file and save it onto the local drive of the client in the specified absolut path
    @param localfilename – the local absolute file name that the file needs to be saved as */
    public synchronized boolean downloadFile(String localfilename) {
        try {
            InputStream is = m_client.getInputStream();
            System.out.println("1'st code");
            BufferedInputStream bis = new BufferedInputStream(is);
            System.out.println(">>>>>>>>>>>"+localfilename);
            
            String ffn  = localfilename.substring(localfilename.lastIndexOf('/'),localfilename.length());
            System.out.println("2'nd code");
            FileOutputStream fos = new FileOutputStream(new File(ffn));
            System.out.println("3'rd code");
            OutputStream os = new FileOutputStream(localfilename);
            System.out.println("4'th code");
            BufferedOutputStream bos = new BufferedOutputStream(os);
            
            System.out.println("write all files.........................");

            byte[] buffer1 = new byte[1024];
            int readCount1;
            System.out.println("5'th code");
            while ((readCount1 = bis.read(buffer1)) > 0) {
                fos.write(buffer1, 0, readCount1);
            }
            fos.close();
                        
            File f = AES.decriptFile(new File(ffn));
            bis = new BufferedInputStream(new FileInputStream(f));
            byte[] buffer = new byte[1024];
            int readCount;
            while ((readCount = bis.read(buffer)) > 0) {
                bos.write(buffer, 0, readCount);
            }
            bos.close();
            is.close(); // close the FTP inputstream
            this.succMesg = "Downloaded!";
            System.out.println("Sucesssfully downloaded");
            return true;
        } catch (Exception ex)
        {
            System.out.println("This is catch block for error");
            ex.printStackTrace();
            StringWriter sw0 = new StringWriter();
            PrintWriter p0 = new PrintWriter(sw0, true);
            ex.printStackTrace(p0);
            erMesg = sw0.getBuffer().toString();
            return false;
        }
    }

    /** The method that connects to the remote FTP server */
    public synchronized boolean connect() {  
        try {
            URL url = new URL("ftp://harishsm@ftp.drivehq.com/" + ";type=i");
            m_client = url.openConnection(); 
            System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>.."+"ftp://" + user + ":" + password + "@" + host + "/" + remoteFile + ";type=i");
            return true;
        } catch (Exception ex) {
            System.out.println("error coming and working another catch");
            ex.printStackTrace();
            StringWriter sw0 = new StringWriter();
            PrintWriter p0 = new PrintWriter(sw0, true);
            ex.printStackTrace(p0);
            erMesg = sw0.getBuffer().toString();
            return false;
            
        }
    }

//    public static void main(String arg[]) {
//        SimpleFTPClient f = new SimpleFTPClient();
//        System.out.println("this is harish..............................working main function in SimpleFTPClient");
//        f.setHost("ftp.drivehq.com");
//        f.setUser("harishsm");
//        f.setPassword("Hari5h@123");
// 
//    }

//        public boolean uploadFile(File file) {
//                try {
//                    FileInputStream fis = new FileInputStream(AES.encriptFile(file));
//                    return uploadFile(fis);
//                } catch (Exception e) {
//                    e.printStackTrace();
//                    return false;
//                }
//            }
    
    public synchronized boolean uploadFile(File file) {
        try {
            // Encrypt the file using AES encryption
            //File encryptedFile = AES.encryptFile(file);

            FTPClient ftpClient = new FTPClient();
            ftpClient.connect(host);
            ftpClient.login(user, password);
            ftpClient.enterLocalPassiveMode();
            ftpClient.setFileType(FTP.BINARY_FILE_TYPE);

            boolean success = false;

            try {
                InputStream is = new FileInputStream(AES.encriptFile(file));
                OutputStream os = ftpClient.storeFileStream(remoteFile);
                byte[] buffer = new byte[1024];
                int bytesRead;

                while ((bytesRead = is.read(buffer)) > 0) {
                    os.write(buffer, 0, bytesRead);
                }

                is.close();
                os.close();

                success = ftpClient.completePendingCommand();
            } catch (IOException e) {
                e.printStackTrace();
            }

            if (success) {
                this.succMesg = "Uploaded encrypted file!";
                System.out.println("Uploaded encrypted file! successfully");
                return true;
            } else {
                this.erMesg = "Upload failed!";
                return false;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            StringWriter sw0 = new StringWriter();
            PrintWriter p0 = new PrintWriter(sw0, true);
            ex.printStackTrace(p0);
            erMesg = sw0.getBuffer().toString();
            return false;
        }
    }
}
