package mini;

import org.junit.Test;
import java.io.*;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;

import static org.junit.Assert.*;

public class MiniCompilerTest {
    @Test
    public void testBenchMarkishTopics() throws UnsupportedEncodingException, FileNotFoundException, IOException {
            File[] files = new File("./benchmarks").listFiles();
            showFiles(files);
    }

    public static void showFiles(File[] files) throws UnsupportedEncodingException, FileNotFoundException, IOException {
//        for (File file : files) {
//            if (file.isDirectory()) {
//                System.out.println("Running test for.......... " + file.getName());
                System.out.println("Running test for.......... " + "mixed");
                File file = new File("mixed");
                runActualTestFiles(file);
//            }
//        }
    }

    public static void runActualTestFiles(File dir) throws UnsupportedEncodingException, FileNotFoundException, IOException {
        String[] args = new String[1];
        args[0] = "benchmarks/"+ dir.getName() +"/"+ dir.getName() +".mini";

        MiniCompiler mc = new MiniCompiler();
        mc.main(args);

        String command = "clang " + mc._llvmFile + " src/main/java/mini/malloc_helper.c src/main/java/mini/read_helper.c";
        System.out.println(command);
        Runtime.getRuntime().exec(command);

        File file = new File(mc._llvmFile);
        file.delete();

        byte[] contents =  Files.readAllBytes(Paths.get("benchmarks/"+ dir.getName() +"/input"));

//        ProcessBuilder pb = new ProcessBuilder("php", "/var/www/script.php", "-m 2");
//        Process p = pb.start();

        Process proc = Runtime.getRuntime().exec("./a.out");
//        System.out.println(contents);
        proc.getOutputStream().write(contents);


        BufferedReader stdInput = new BufferedReader(new InputStreamReader(proc.getInputStream()));
        String s;
        while ((s = stdInput.readLine()) != null) {
            System.out.println(s);
        }

        BufferedReader stdError = new BufferedReader(new InputStreamReader(proc.getErrorStream()));
        while ((s = stdError.readLine()) != null) {
            System.out.println(s);
        }
    }
}