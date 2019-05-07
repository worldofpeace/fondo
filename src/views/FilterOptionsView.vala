/*
* Copyright (C) 2018  Calo001 <calo_lrc@hotmail.com>
* 
* This program is free software: you can redistribute it and/or modify
* it under the terms of the GNU Affero General Public License as published
* by the Free Software Foundation, either version 3 of the License, or
* (at your option) any later version.
* 
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
* GNU Affero General Public License for more details.
* 
* You should have received a copy of the GNU Affero General Public License
* along with this program.  If not, see <http://www.gnu.org/licenses/>.
* 
*/
using App.Configs;
namespace App.Views {

    /**
     * The {@code FilterOptionsView} class.
     *
     * @since 1.0.0
     */
    public class FilterOptionsView : Gtk.Grid {
        public string filtermode { get; set; }
        /**
         * Constructs a new {@code FilterOptionsView} object.
         */
        public FilterOptionsView () {
            Object (
                margin: 0,
                row_spacing: 0,
                expand: true
            );

            var button_landscape = new Gtk.RadioButton.with_label (null, "Landscape");
            button_landscape.get_style_context ().add_class (Gtk.STYLE_CLASS_MENUITEM);
            button_landscape.expand = true;

            var button_portrait = new Gtk.RadioButton.with_label (null, "Portrait");
            button_portrait.get_style_context ().add_class (Gtk.STYLE_CLASS_MENUITEM);
            button_portrait.expand = true;

            var button_any = new Gtk.RadioButton.with_label (null, "Any");
            button_any.get_style_context ().add_class (Gtk.STYLE_CLASS_MENUITEM);
            button_any.expand = true;

            button_portrait.join_group (button_landscape);
            button_any.join_group (button_landscape);

            var lbl_filter = new Gtk.Label ("Orientation");
            lbl_filter.get_style_context ().add_class ("h4");

            button_landscape.clicked.connect ( ()=> {
                if (button_landscape.active) {
                    filtermode = "landscape";
                }
            });

            button_portrait.clicked.connect ( ()=> {
                if (button_portrait.active) {
                    filtermode = "portrait";
                }
            });

            button_any.clicked.connect ( ()=> {
                if (button_any.active) {
                    filtermode = "any";
                }
            });

            App.Application.settings.bind ("filter-mode", this, "filtermode", GLib.SettingsBindFlags.DEFAULT);

            attach (lbl_filter,         0, 0, 1, 1);
            attach (button_any,         0, 1, 1, 1);
            attach (button_portrait,    0, 2, 1, 1);
            attach (button_landscape,   0, 3, 1, 1);
        }
    }
}