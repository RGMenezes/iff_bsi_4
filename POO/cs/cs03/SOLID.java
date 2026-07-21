package POO.cs.cs03;

public class SOLID {
  public static void main(String[] args) {
    System.out.println("SOLID Principles in Java");
  }


  // // SRP - Single Responsibility Principle - Principio da Responsabilidade Única
  // // Responsável estritamente por controlar a reprodução do arquivo de mídia
  // public class ReprodutorMidia {
  //   public void darPlay(Video video);
  //   public void darPause();
  // }

  // // Responsável apenas por atualizar as métricas e o histórico do perfil do usuário
  // public class HistoricoUsuarioService {
  //   public void registrarVisualizacao(Usuario usuario, Video video) {
  //     // Salva no banco de dados que o usuário assistiu ao vídeo
  //   }
  // }


  // // OCP - Open/Closed Principle - Princípio Aberto/Fechado
  // public interface PlanoAssinatura {
  //   boolean podeAssistir4K();
  //   int limiteDispositivosSimultaneos();
  // }

  // public class PlanoPremium implements PlanoAssinatura {
  //   public boolean pdeAssistir4K() { return true; }
  //   public int limiteDispositivosSimultaneos() { return 4; }
  // }

  // public class PlanoGratuito implements PlanoAssinatura {
  //   public boolean podeAssistir4K() { return false; }
  //   public int limiteDispositivosSimultaneos() { return 1; }
  // }

  // // Essa classe nunca mais muda, não importa quantos planos novos surjam
  // public class ValidadorDeSessao {
  //   public void iniciarTransmissao(PlanoAssinatura plano) {
  //     if (plano.podeAssistir4K()) {
  //       // Inicia a transmissão em 4K
  //     } else {
  //       // Inicia a transmissão em HD
  //     }
  //   }
  // }



  // // LSP - Liskov Substitution Principle - Princípio da Substituição de Liskov
  // public abstract class ConteudoStreaming {
  //   private String titulo;
  //   // Métodos comuns a absolutamente todos os conteúdos
  // }

  // public abstract class ConteudoGravado extends ConteudoStreaming {
  //   public abstract int getDuracaoEmMinutos();
  // }

  // public class Filme extends ConteudoGravado {
  //   public int getDuracaoEmMinutos() { return 142; }
  // }

  // public class TransmissaoAoVivo extends ConteudoStreaming {
  //   // Não tem duração fixa, mas pode ter um método para obter o link do feed RTMP
  //   public String getUrlFeedAoVivo() {
  //     return "rtmp://live...";
  //   }
  // }


  // // ISP - Interface Segregation Principle - Princípio da Segregação de Interfaces
  // public interface ControladorBasico {
  //   void darPlay();
  //   void darPause();
  // }

  // public interface ControladorVideo {
  //   void alternarLegenda(String idioma);
  // }

  // // O player de vídeo implementa ambos
  // public class PlayerVideoWeb implements ControladorBasico, ControladorVideo {
  //   public void darPlay() { /* ... */ }
  //   public void darPause() { /* ... */ }
  //   public void alternarLegenda(String idioma) { /* ... */ }
  // }

  // // O player de áudio fica limpo de métodos irrelevantes
  // public class PlayerPodcast implements ControladorBasico {
  //   public void darPlay() { /* ... */ }
  //   public void darPause() { /* ... */ }
  // }



  // // DIP - Dependency Inversion Principle - Princípio da Inversão de Dependência
  // public interface CanalNotificacao {
  //   void enviarNotificacao(String mensagem, Usuario usuario);
  // }

  // // Implementações de baixo nível de infraestrutura
  // public class FirebasePushNotification implements CanalNotificacao {
  //   public void enviarNotificacao(String msg, Usuario u) { /* Código do Firebase */ }
  // }

  // public class EmailNotification implements CanalNotificacao {
  //   public void enviarNotificacao(String msg, Usuario u) { /* Código de e-mail */ }
  // }

  // // Classe de alto nível (Regra de Negócio) protegida contra mudanças de infraestrutura
  // public class NotificadorLancamentos {
  //   private final CanalNotificacao canal;

  //   // Injeção de dependência: a classe aceita qualquer canal que respeite o contrato
  //   public NotificadorLancamentos(CanalNotificacao canal) {
  //     this.canal = canal;
  //   }

  //   public void novoConteudoDisponivel(Video video, Usuario usuario) {
  //     String msg = "Já está disponível: " + video.getTitulo();
  //     canal.enviarNotificacao(msg, usuario);
  //   }
  // }
}
