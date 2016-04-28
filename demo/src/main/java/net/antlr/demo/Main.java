package net.antlr.demo;

import net.antlr.xcode.XCodeBaseVisitor;
import net.antlr.xcode.XCodeLexer;
import net.antlr.xcode.XCodeParser;
import org.antlr.v4.runtime.ANTLRInputStream;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTree;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.List;

import static net.antlr.xcode.XCodeParser.*;

public class Main {
    public static void main(String[] args) {
        InputStream inputStream = Main.class.getClassLoader().getResourceAsStream("test.xcodeproj/project.pbxproj");
        InputStreamReader reader = new InputStreamReader(inputStream);
        ANTLRInputStream in = null;
        try {
            in = new ANTLRInputStream(reader);
            reader.close();
        } catch (IOException e) {
            e.printStackTrace();
            System.exit(1);
        }
        XCodeLexer lexer = new XCodeLexer(in);
        CommonTokenStream tokens = new CommonTokenStream(lexer);
        XCodeParser  parser = new XCodeParser(tokens);
        ParseTree tree = parser.compilationUnit();
        ProjectScanner scanner = new ProjectScanner();
        scanner.visit(tree);
    }

    public static class ProjectScanner extends XCodeBaseVisitor<Void> {
        @Override
        public Void visitCompilationUnit(CompilationUnitContext ctx) {
            BlockContext block = ctx.block();
            if (block != null) {
                List<StatementContext> statements = block.statement();
                for (StatementContext statementContext : statements) {
                    if (statementContext instanceof RootObjectExpressionContext) {
                        RootObjectExpressionContext rootObjectExpression = (RootObjectExpressionContext) statementContext;
                        System.out.println("root: " + rootObjectExpression.GuidWithComment().getText());
                    } else if (statementContext instanceof ObjectsContext) {
                        ObjectsContext objects = (ObjectsContext) statementContext;
                        // TODO:
                    }
                }
            }
            return null;
        }
    }
}
