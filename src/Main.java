import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.*;
import java.util.regex.Pattern;

class Solution {

    private static class ConcordanceData {
        private int frequency;
        private final List<Integer> occurrenceInSentenceNum;

        public ConcordanceData(int occurrence) {
            this.occurrenceInSentenceNum = new ArrayList<>();
            this.occurrenceInSentenceNum.add(occurrence);
            this.frequency = 1;
        }

        public void addSentenceOccurance(int occurance) {
            occurrenceInSentenceNum.add(occurance);
        }

        public void incrementFreq() {
            this.frequency += 1;
        }

        @Override
        public String toString() {
            StringBuilder sb = new StringBuilder();
            sb.append(occurrenceInSentenceNum.get(0));
            occurrenceInSentenceNum.stream().skip(1).forEach((i) -> sb.append(", ").append(i));
            return "{" + frequency + " : " + sb + "}";
        }
    }

    private static TreeMap<String, ConcordanceData> concordance(String text) {
        TreeMap<String, ConcordanceData> concordanceCounter = new TreeMap<>(String::compareToIgnoreCase);
        //regex to handle abbrievations such as i.e.
        Pattern SENTENCE_SPLIT_REGEX = Pattern.compile("(([!.?])$)|\\.(?=\\s[A-Z])");
        String[] sentences = SENTENCE_SPLIT_REGEX.split(text);
        int currentSentenceNum = 1;
        for (String s: sentences) {
            Pattern WORD_SPLIT_REGEX = Pattern.compile("[!?:,\\s]|\\.(?=\\s[a-z])");
            String[] words = WORD_SPLIT_REGEX.split(s);
            for(String w: words) {
                if(concordanceCounter.containsKey(w)) {
                    ConcordanceData ref = concordanceCounter.get(w);
                    ref.addSentenceOccurance(currentSentenceNum);
                    ref.incrementFreq();
                } else {
                    if(w.length() == 0) {
                        continue;
                    }
                    concordanceCounter.put(w, new ConcordanceData(currentSentenceNum));
                }
            }
            currentSentenceNum += 1;
        }
        return concordanceCounter;
    }

    private static String readFileAsString(String filePath) throws IOException {
        StringBuilder fileData = new StringBuilder();
        try (BufferedReader reader = new BufferedReader(new FileReader(filePath))) {
            char[] buf = new char[1024];
            int numRead;
            while ((numRead = reader.read(buf)) != -1) {
                String readData = String.valueOf(buf, 0, numRead);
                fileData.append(readData);
            }
        }
        return fileData.toString();
    }

    public static void main(String[] args) throws IOException {
        String text = readFileAsString(String.valueOf(Paths.get( System.getProperty("user.dir"), "/src/TextDocument.txt")));
        TreeMap<String, ConcordanceData> test = concordance(text);
        Set<Map.Entry<String, ConcordanceData>> sortedSet = test.entrySet();
        sortedSet.forEach(stringConcordanceDataEntry -> System.out.printf("%-15s %50s\n", stringConcordanceDataEntry.getKey(), stringConcordanceDataEntry.getValue().toString()));
    }
}