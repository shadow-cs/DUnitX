{***************************************************************************}
{                                                                           }
{           DUnitX                                                          }
{                                                                           }
{           Copyright (C) 2013 Vincent Parrett                              }
{                                                                           }
{           vincent@finalbuilder.com                                        }
{           http://www.finalbuilder.com                                     }
{                                                                           }
{                                                                           }
{***************************************************************************}
{                                                                           }
{  Licensed under the Apache License, Version 2.0 (the "License");          }
{  you may not use this file except in compliance with the License.         }
{  You may obtain a copy of the License at                                  }
{                                                                           }
{      http://www.apache.org/licenses/LICENSE-2.0                           }
{                                                                           }
{  Unless required by applicable law or agreed to in writing, software      }
{  distributed under the License is distributed on an "AS IS" BASIS,        }
{  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. }
{  See the License for the specific language governing permissions and      }
{  limitations under the License.                                           }
{                                                                           }
{***************************************************************************}

unit DUnitX.Expert.CodeGen.NewUnit;
// This is done to Warnings that I can't control, as Embarcadero has
// deprecated the functions, but due to design you are still required to
// to implement.
{$WARN SYMBOL_DEPRECATED OFF}
interface

uses
  ToolsAPI;

type

  TNewUnit = class(TNotifierObject,IOTACreator,IOTAModuleCreator)
  protected
    //Specific to class
    FFormName : String;
    FImplFileName : string;
    FIntfFileName : string;
    FAncestorName : string;
    procedure SetAncestorName(const Value: string); virtual;
    procedure SetFormName(const Value: string); virtual;
    procedure SetImplFileName(const Value: string); virtual;
    procedure SetIntfFileName(const Value: string); virtual;
    // IOTACreator
    function GetCreatorType: string; virtual;
    function GetExisting: Boolean;
    function GetFileSystem: string;
    function GetOwner: IOTAModule;
    function GetUnnamed: Boolean;
    // IOTAModuleCreator
    function GetAncestorName: string;
    function GetImplFileName: string;
    function GetIntfFileName: string;
    function GetFormName: string;
    function GetMainForm: Boolean;
    function GetShowForm: Boolean;
    function GetShowSource: Boolean;
    function NewFormFile(const FormIdent, AncestorIdent: string): IOTAFile; virtual;
    function NewImplSource(const ModuleIdent, FormIdent, AncestorIdent: string): IOTAFile; virtual;
    function NewIntfSource(const ModuleIdent, FormIdent, AncestorIdent: string): IOTAFile; virtual;
    procedure FormCreated(const FormEditor: IOTAFormEditor); virtual;
  public
    property FormName :  string read GetFormName write SetFormName;
    property ImplFileName : string read GetImplFileName write SetImplFileName;
    property IntfFileName : string read GetIntfFileName write SetIntfFileName;
    property AncestorName : string read GetAncestorName write SetAncestorName;
  end;




implementation

{ TUnitCreator }

procedure TNewUnit.FormCreated(const FormEditor: IOTAFormEditor);
begin
end;

function TNewUnit.GetAncestorName: string;
begin
 Result := FAncestorName;
end;

function TNewUnit.GetCreatorType: string;
begin
  result := sUnit;
end;

function TNewUnit.GetExisting: Boolean;
begin
 result := false;
end;

function TNewUnit.GetFileSystem: string;
begin
  result := '';
end;

function TNewUnit.GetFormName: string;
begin
 result := FFormName;
end;

function TNewUnit.GetImplFileName: string;
begin
  result := FImplFileName;
end;

function TNewUnit.GetIntfFileName: string;
begin
  Result := FIntfFileName;
end;

function TNewUnit.GetMainForm: Boolean;
begin
  result := false;
end;

function TNewUnit.GetOwner: IOTAModule;
begin
  result := nil;
end;

function TNewUnit.GetShowForm: Boolean;
begin
  result := False;
end;

function TNewUnit.GetShowSource: Boolean;
begin
  result := True;
end;

function TNewUnit.GetUnnamed: Boolean;
begin
  result := true;
end;

function TNewUnit.NewFormFile(const FormIdent,
  AncestorIdent: string): IOTAFile;
begin
  result := nil;
end;

function TNewUnit.NewImplSource(const ModuleIdent, FormIdent,
  AncestorIdent: string): IOTAFile;
begin
  Result := nil;
end;

function TNewUnit.NewIntfSource(const ModuleIdent, FormIdent,
  AncestorIdent: string): IOTAFile;
begin
 result := nil;
end;

procedure TNewUnit.SetAncestorName(const Value: string);
begin
  FAncestorName  := Value;
end;

procedure TNewUnit.SetFormName(const Value: string);
begin
  FFormName := Value;
end;

procedure TNewUnit.SetImplFileName(const Value: string);
begin
  FImplFileName := Value;
end;

procedure TNewUnit.SetIntfFileName(const Value: string);
begin
  FIntfFileName := Value;
end;




end.
