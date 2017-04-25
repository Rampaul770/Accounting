unit Localization;

interface

type
  TLangCommon = class
    BtnAccept            :string;
    BtnCancel            :string;
    BtnNew               :string;
    BtnModify            :string;
    BtnDelete            :string;
    BtnReport            :string;
    TextSearch           :string;
    TextCode             :string;
    TextDescription      :string;
    TextName             :string;
    AskForDelete         :string;
    ImposibleInsert      :string;
    ImposibleModify      :string;
    ImposibleDelete      :string;
    ImposibleCancel      :string;
    AskCancelEditing     :string; //'�Quiere anular las modificaciones realizadas a este proyecto?';
    CloseNotAllowed      :string;
    FieldCantBeLeftBlank :string;
    ReferenceMessageText :string; //'El proyecto seleccionado se encuentra referenciado en alguna anal�tica.'
    constructor Create;
  end;

  TLangLogin = class
    NumberOfAttemptsExceeded       :string;
    ApplicationIsGoingToCloseNow   :string;
    TheUserOrPasswordAreNotCorrect :string;
    PleaseTryAgain                 :string;
    constructor Create;
  end;

  TLangProjects = class
    FormTitle     :string;
    TextProject   :string;
    TextAnalytics :string;
    constructor Create;
  end;

implementation

uses Globales;

{ TLangCommon }

constructor TLangCommon.Create;
begin
   case Config.HMI_Language of
      ltEnglish:begin
        BtnAccept            := 'Accept';
        BtnCancel            := 'Cancel';
        BtnNew               := 'New';
        BtnModify            := 'Modify';
        BtnDelete            := 'Delete';
        BtnReport            := 'Report';
        TextSearch           := 'Search';
        TextCode             := 'Code';
        TextDescription      := 'Description';
        TextName             := 'Name';
        AskForDelete         := 'Do you really want delete the selected element?';
        ImposibleInsert      := 'Imposible insert a new element';
        ImposibleModify      := 'It was not possible edit the selected element';
        ImposibleDelete      := 'It was not possible delete the selected element';
        ImposibleCancel      := 'It was not possible cancel the operation';
        AskCancelEditing     := 'Really want cancel editing changes?';
        CloseNotAllowed      := 'Close not allowed in editing mode';
        FieldCantBeLeftBlank := '%s field can''t be left blank';
        ReferenceMessageText := 'Current %s exists in at least one %s';
      end;
      ltSpanish:begin
        BtnAccept            := 'Aceptar';
        BtnCancel            := 'Cancelar';
        BtnNew               := 'Nuevo';
        BtnModify            := 'Modify';
        BtnDelete            := 'Delete';
        BtnReport            := 'Report';
        TextSearch           := 'Buscar';
        TextCode             := 'C�digo';
        TextDescription      := 'Descripci�n';
        TextName             := 'Nombre';
        AskForDelete         := '�Desea realmente eliminar el elemento seleccionado?';
        ImposibleInsert      := 'Imposible Insertar un nuevo elemento';
        ImposibleModify      := 'No fue posible editar el elemento seleccionado';
        ImposibleDelete      := 'No ha sido posible eliminar el elemento seleccionado';
        ImposibleCancel      := 'No fue posible cancelar la operaci�n';
        AskCancelEditing     := '�Realmente quiere cancelar los cambios de edici�n?';
        CloseNotAllowed      := 'No se puede cerrar en modo de edici�n';
        FieldCantBeLeftBlank := 'El campo %s no puede dejarse en blanco';
        ReferenceMessageText := 'El %s actual existe en al menos una %s';
      end;
      ltFrench:begin
        BtnAccept            := 'Acceptez';
        BtnCancel            := 'Annuler';
        BtnNew               := 'Nouveau';
        BtnModify            := 'Modifier';
        BtnDelete            := 'Effacer';
        BtnReport            := 'Rapport';
        TextSearch           := 'Chercher';
        TextCode             := 'Code';
        TextDescription      := 'La description';
        TextName             := 'Pr�nom';
        AskForDelete         := 'Voulez-vous vraiment supprimer l''�l�ment s�lectionn�?';
        ImposibleInsert      := 'Impossible ins�rer un nouvel �l�ment';
        ImposibleModify      := 'Il n''�tait pas possible d''�diter l''�l�ment s�lectionn�';
        ImposibleDelete      := 'Il n''�tait pas possible de supprimer l''�l�ment s�lectionn�';
        ImposibleCancel      := 'Il n''�tait pas possible d''annuler l''op�ration';
        AskCancelEditing     := 'Voulez-vous vraiment annuler les modifications d''�dition?';
        CloseNotAllowed      := 'Fermer interdit en mode �dition';
        FieldCantBeLeftBlank := 'Le champ %s ne peut pas �tre laiss� vide';
        ReferenceMessageText := 'Le %s actuel existe dans au moins une %s';
      end;
      ltGerman:begin
        BtnAccept            := 'Akzeptieren';
        BtnCancel            := 'Stornieren';
        BtnNew               := 'Neu';
        BtnModify            := '�ndern';
        BtnDelete            := 'L�schen';
        BtnReport            := 'Bericht';
        TextSearch           := 'Suche';
        TextCode             := 'Code';
        TextDescription      := 'Beschreibung';
        TextName             := 'Name';
        AskForDelete         := 'M�chten Sie das ausgew�hlte Element wirklich l�schen?';
        ImposibleInsert      := 'Unm�glich ein neues Element einf�gen';
        ImposibleModify      := 'Es war nicht m�glich, das ausgew�hlte Element zu bearbeiten';
        ImposibleDelete      := 'Es war nicht m�glich, das ausgew�hlte Element zu l�schen';
        ImposibleCancel      := 'Es war nicht m�glich, den Vorgang abzubrechen';
        AskCancelEditing     := 'Wollen Sie die Bearbeitung �ndern?';
        CloseNotAllowed      := 'Im Bearbeitungsmodus nicht zugelassen';
        FieldCantBeLeftBlank := '%s-Feld kann nicht leer sein';
        ReferenceMessageText := 'Das %s Projekt existiert in mindestens einer %s';
      end;
   end;
end;

{ TLangLogin }

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

{ TLangProjects }

constructor TLangProjects.Create;
begin
   case Config.HMI_Language of
      ltEnglish:begin
        FormTitle     := 'Table of Projects';
        TextProject   := 'Project';
        TextAnalytics := 'Analytic';
      end;
      ltSpanish:begin
        FormTitle     := 'Tabla de Proyectos';
        TextProject   := 'Proyecto';
        TextAnalytics := 'Anal�tica';
      end;
      ltFrench:begin
        FormTitle     := 'Tableau des projets';
        TextProject   := 'Projet';
        TextAnalytics := 'Analyse';
      end;
      ltGerman:begin
        FormTitle     := 'Tabelle der Projekte';
        TextProject   := 'Projekt';
        TextAnalytics := 'Analytischen';
      end;
   end;
end;

end.
