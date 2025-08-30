/*
 * Document   : Utils
 * Author     : Franklin Barzola Olivares <frankoantonio@gmail.com>
 */
package com.yupanastudio.igest.server.principal.dml;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Utils {

    /**
     * Crea un log detallado de las excepciones generadas en el sistema.
     *
     * @param c La clase que generó la excepción.
     * @param ex La excepción generada.
     * @param nomGrpEmp Nombre del grupo empresarial para el nombre del archivo.
     */
    public static void crearLog(Class<?> c, Exception ex, String nomGrpEmp) {
        String homeUser = System.getProperty("user.home");
        String logFileName = homeUser + "/YUPANASTUDIO.IGEST." + nomGrpEmp + "-" + MyConvert.dateToString(LocalDate.now()) + ".log";

        // Asegúrar que la ruta de destino exista y sea accesible.
        File logFile = new File(logFileName);
        try (FileWriter archivo = new FileWriter(logFile, true)) {
            archivo.write("...\r\n");
            archivo.write(MyConvert.dateTimeToString(LocalDateTime.now()) + " - " + c.getName() + "\r\n");

            // Detalle de la excepción en el log (Stack Trace)
            StringWriter sw = new StringWriter();
            PrintWriter pw = new PrintWriter(sw);
            ex.printStackTrace(pw);
            archivo.write(sw.toString());

            archivo.write("...\r\n");
            archivo.write("========================================================================================================================\r\n");
        } catch (IOException ex1) {
            Logger.getLogger(Utils.class.getName()).log(Level.SEVERE, "Error al escribir en el log. Clase: " + c.getName(), ex1);
        }
    }

}

class MyConvert {

    /**
     * Convertir objeto LocalDate a cadena con formato establecido.
     *
     * @param fecha Objeto LocalDate
     * @param formato Cadena con formato. Ej. "yyyy-MM-dd"
     * @return Cadena con el formato establecido.
     */
    public static String dateToString(LocalDate fecha, String formato) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern(formato);
        return fecha.format(formatter).toUpperCase();
    }

    /**
     * Sobrecarga del método para usar formato predeterminado.
     */
    public static String dateToString(LocalDate fecha) {
        return dateToString(fecha, "yyyy-MM-dd");
    }

    /**
     * Convertir objeto LocalDateTime a cadena con formato establecido.
     *
     * @param fecha Objeto LocalDateTime
     * @param formato Cadena con formato. Ej. "yyyy-MM-dd HH:mm:ss"
     * @return Cadena con el formato establecido.
     */
    public static String dateTimeToString(LocalDateTime fecha, String formato) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern(formato);
        return fecha.format(formatter).toUpperCase();
    }

    /**
     * Sobrecarga del método para usar formato predeterminado.
     */
    public static String dateTimeToString(LocalDateTime fecha) {
        return dateTimeToString(fecha, "yyyy-MM-dd HH:mm:ss");
    }

}
