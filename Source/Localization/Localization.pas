unit Localization;

interface

type
  TLangCommon = class
    BtnAccept :string;
    BtnCancel :string;
    constructor Create;
  end;

  TLangLogin = class
     NumberOfAttemptsExceeded       :string;
     ApplicationIsGoingToCloseNow   :string;
     TheUserOrPasswordAreNotCorrect :string;
     PleaseTryAgain                 :string;
     constructor Create;
  end;

implementation

uses Globales;

{ TLangLogin }

{ TLangCommon }

constructor TLangCommon.Create;
begin
   case Config.HMI_Language of
      ltEnglish:begin
        BtnAccept := 'Accept';
        BtnCancel := 'Cancel';
      end;
      ltSpanish:begin
        BtnAccept := 'Aceptar';
        BtnCancel := 'Cancelar';
      end;
      ltFrench:begin
        BtnAccept := 'Acceptez';
        BtnCancel := 'Annuler';
      end;
      ltGerman:begin
        BtnAccept := 'Akzeptieren';
        BtnCancel := 'Stornieren';
      end;
   end;
end;

constructor TLangLogin.Create;
begin
   case Config.HMI_Language of
      ltEnglish:begin
        NumberOfAttemptsExceeded       := 'Number of attempts exceeded';
        ApplicationIsGoingToCloseNow   := 'Application is going to close now!';
        TheUserOrPasswordAreNotCorrect := 'The user or password are not correct';
        PleaseTryAgain                 := 'Please, try again';
      end;
      ltSpanish:begin
        NumberOfAttemptsExceeded       := 'N�mero de intentos superado';
        ApplicationIsGoingToCloseNow   := 'La aplicaci�n se cerrar� ahora!';
        TheUserOrPasswordAreNotCorrect := 'El usuario o la contrase�a no son correctos';
        PleaseTryAgain                 := 'Por favor, int�ntelo de nuevo';
      end;
      ltFrench:begin
        NumberOfAttemptsExceeded       := 'Nombre de tentatives d�pass�es';
        ApplicationIsGoingToCloseNow   := 'La demande va bient�t se terminer!';
        TheUserOrPasswordAreNotCorrect := 'L''utilisateur ou le mot de passe ne sont pas corrects';
        PleaseTryAgain                 := 'Veuillez r�essayer';
      end;
      ltGerman:begin
        NumberOfAttemptsExceeded       := 'Anzahl der Versuche �berschritten';
        ApplicationIsGoingToCloseNow   := 'Die Bewerbung wird jetzt geschlossen!';
        TheUserOrPasswordAreNotCorrect := 'Der Benutzer oder das Passwort sind nicht korrekt';
        PleaseTryAgain                 := 'Bitte versuche es erneut';
      end;
   end;
end;

end.
